class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def new
        @post = Post.new
    end

    def create 
        
        @post = current_user.posts.build(post_params)
        @post.user = current_user

        respond_to do |format|
        if @post.save
            
            format.html { redirect_to root_path, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
            
          else
            
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
            end
          end
    end

    def index 
        @posts = Post.all.order(created_at: :desc)
        
    end
    
    def show
        @post = Post.find(params[:id])
      end

    private

    def post_params
        params.require(:post).permit(:title, :description)
    end
    

end