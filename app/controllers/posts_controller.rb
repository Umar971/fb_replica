class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all.order("created_at DESC")      
    end
    
    def show
    end

    def new
        @post = current_user.posts.build
    end
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_path, notice: "Successfully created the post"
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Successfully updated the post"
        else
            render 'edit'
        end
    end
    
    def destroy
        @post.destroy
        redirect_to root_path, notice: "Successfully deleted the post"
    end
    
    private

        def set_post
            @post = Post.find_by(id: params[:id])            
        end
        
        def post_params
            params.require(:post).permit(:body, images: [])
        end
end
