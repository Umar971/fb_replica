module ApplicationHelper

def user_avatar(user, size)
    if user.avatar.attached?
        user.avatar
    else
        image_url("default_profile_pic.png")
    end
end




end
