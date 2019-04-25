module Contexts
  module UserContexts
    # Context for users (assumes contexts for others exist)
    def create_users
      @user1 = FactoryBot.create(:user) 
      @user2 = FactoryBot.create(:user, email:"yy@cc.com")
      @user3 = FactoryBot.create(:user, email:"y2@cc.com")
      @user4 = FactoryBot.create(:user, email:"y3@cc.com")
    end
    
    def remove_users
      @user1.destroy
      @user2.destroy
      @user3.destroy
      @user4.destroy
    end
  end
end