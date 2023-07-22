class UsersController < ApplicationController
    load_and_authorize_resource :user

    def show  
    end

    def account_info
    end  
end
  