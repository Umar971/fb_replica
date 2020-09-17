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

end
