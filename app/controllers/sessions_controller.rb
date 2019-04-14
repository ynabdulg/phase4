class SessionsController < ApplicationController
    def new
    end
    
    def create
       user = User.find_by(email: params[:sessions][:email].downcase) 
       if user && user.authenticate(params[:sessions][:password])
           login(user)
           redirect_to user
       else
           flash.now[:danger] = "Invalid email or password"
           render 'new'
       end
    end
    
    def destroy
        logout
        redirect_to root_url
    end
end
