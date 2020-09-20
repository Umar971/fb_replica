class RepliesController < ApplicationController
    before_action :set_comment
    before_action :set_reply, only: [:destroy]

    def create
        reply = @comment.replies.create(params[:reply].permit(:body))
        reply.user_id = current_user.id
        reply.save
    end
    
    def destroy
        @reply.destroy
    end
    
    private

        def set_comment
            @comment = Comment.find_by(id: params[:comment_id])
        end

        def set_reply
            @reply = @comment.replies.find(params[:id])
        end
end
