class PostsController < ApplicationController
  def index
    @welcome_msg = "Hola Amigo!"
    @posts = PostsController.allposts
    render :layout => 'otherlayout'
  end

  def create
    @params = params
    @title = params["title"]
    @author = params["author"]
    @body = params["body"]
  end

  def show
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      number = params[:id].to_i
      if post[:id] == number
        @mypost = post
      end
    end
    if @mypost == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

  end

  def new

  end

  def edit
  end

  def update
  end

  def destroy
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
