require 'rails_helper'
RSpec.describe PostsController, type: :controller do

  context '#index' do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
    it "renders the index template"  do
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
    end
    it "renders the posts/index template"  do
      get :index
      expect(response).to  render_template("posts/index")
      expect(response.body).to eq ""
    end
  end

  context '#new' do
    it "assigns a new Post to @post" do
      get :new
      expect(assigns(:post)).to  be_a_new(Post)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  context '#create' do
      before {@post = Post.create(title: "Title", content: "Content")}
      it "does save the new post in the database" do
        expect{
          post :create,
               post: {title: @post.title, content: @post.content}
        }.to change(Post, :count).by(1)
      end
      it "re-renders the assigns[:post] template" do
        post :create,
             post: {title: @post.title, content: @post.content}
        expect(response).to redirect_to post_path(assigns[:post])
      end
  end

  context '#destroy' do
    before {@post = Post.create(title: "Title", content: "Content")}
    it "delete the post" do
      expect{
        delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it "redirect to widget#index" do
      delete :destroy, id: @post
      expect(response).to redirect_to posts_path
    end
  end
end