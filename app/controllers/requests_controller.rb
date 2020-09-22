class RequestsController < ApplicationController

    before_action :set_request, only: [:update, :destroy]
    def create
        @request = Request.create
        @request.sender_id = current_user.id
        @request.receiver_id = params[:receiver_id]
        @request.status = 'p'
        @request.save
        redirect_to request.referer
    end
    

    def update
        if @request
            @request.update(status: "a")
            redirect_to request.referer
        end
    end
    
    def destroy
        @request.destroy
        redirect_to request.referer
    end
    
    
    private

        def set_request
            @request = Request.find_by(id: params[:id])        
        end
        
end
