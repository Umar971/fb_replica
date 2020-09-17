class LikesController < ApplicationController
    before_action :set_like, only: [:destroy]

    def create
        @post = Post.find(params[:post_id])
        @post.likes.create(user_id: current_user.id)
    end
    
    def destroy
        @like.destroy
    end

    private
        def set_like
            @post = Post.find(params[:id])
            @like = @post.likes.find_by(user_id: current_user.id)
        end
end
