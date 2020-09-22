module ApplicationHelper

    def user_avatar(user, size)
        if user.avatar.attached?
            user.avatar
        else
            image_url("default_profile_pic.png")
        end
    end

    def already_liked_by_user(user_id, post_id)
        Like.where(user_id: user_id, post_id: post_id).exists?
    end

    def get_all_friend_requests(user_id)
        Request.where("receiver_id = #{user_id} and status = 'p'")
    end
    
    def get_all_senders(friend_requests)
        senders = friend_requests.collect(&:sender_id)
        User.where(id: senders)        
    end
    
    def get_specific_request(user_id)
        Request.where("((receiver_id = #{user_id} and sender_id = #{current_user.id}) or (receiver_id = #{current_user.id} and sender_id = #{user_id})) and status = 'a'")
    end

    def friend?(user_id)
       get_specific_request(user_id).present?
    end
    
    def received_request(user_id)
        Request.where("(receiver_id = #{current_user.id} and sender_id = #{user_id}) and status = 'p'")
    end
    
    def get_all_friends(user_id)
        Request.where("(receiver_id = #{user_id} or sender_id = #{user_id}) and status = 'a'")
    end

    def get_friend(id)
        User.find_by(id: id)
    end

    def request_sent?(user_id)
        Request.where("(receiver_id = #{user_id} or sender_id = #{user_id}) and status = 'p'").present?
    end
    
    
end
