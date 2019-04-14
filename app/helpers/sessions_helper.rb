module SessionsHelper
    def login(user)
        sessions[:user_id] = user.id
    end
    
    def current_user
        @current_user ||= User.find_by(id: sessions[:user_id])
    end
    
    def logged_in?
       !current_user.nil?
    end
    
    def logout
        sessions.delete(:user_id)
        @current_user = nil
    end
end
