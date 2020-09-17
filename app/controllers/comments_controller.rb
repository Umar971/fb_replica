class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:destroy]

    def create
        comment = @post.comments.create(params[:comment].permit(:body))
        comment.user_id = current_user.id
        comment.save
        @comments = @post.comments.last(5)
    end
    
    def destroy
        @comment.destroy
        @comments = @post.comments.last(5)
    end
    

    private
        def set_post
            @post = Post.find_by(id: params[:post_id])			
        end

        def set_comment
            @comment = @post.comments.find(params[:id])
        end

end
