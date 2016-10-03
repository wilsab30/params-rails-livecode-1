class PostsController < ApplicationController

  def findPost
    return Post.find(params[:id].to_i)
  end

  def index
    @posts = Post.all
  end

  def create
    @params = params
    @mypost = Post.new
    @mypost.title = params[:post][:title]
    @mypost.author = params[:post][:author]
    @mypost.body = params[:post][:body]
    @mypost.save
    redirect_to root_path
  end

  def show
    @mypost = findPost
  end

  def new
    @mypost = Post.new
  end

  def edit
    @mypost = findPost
    if @mypost == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

  end

  def update
    @mypost = findPost
    if @mypost == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

    @mypost.title = params["title"]
    @mypost.author = params["author"]
    @mypost.body  = params["body"]
    @mypost.save
    redirect_to root_path
  end

  def destroy
    @mypost = findPost
    if @mypost != nil
      @mypost.destroy
      redirect_to root_path
    end
  end

  def self.allposts
    [
      {id: 1, title: "My First Blog Post",
          author: "Dave Matthews",
          body: "Loren Ipsem"},
      {id: 2, title: "My Second Blog Post",
              author: "Dave Matthews",
              body: "This is the body"},
      {id: 3, title: "My Third Blog Post",
          author: "Dave Matthews",
          body: "I get seen around Seattle all the time."}

    ]
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :body)
  end
end
