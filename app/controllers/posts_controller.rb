class PostsController < ApplicationController

    before_action :require_login, only: [:new, :create]

    def new
        @post = Post.new
    end

    def create 
        
        @post = current_user.posts.build(post_params)

        if @post.save
            format.html { redirect_to @post, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
    end

    def index 
        @posts = Post.all.order(created_at: :desc)
        
    end

    private

    def post_params
        params.require(:post).permit(:title, :description)
    end
    
    
end