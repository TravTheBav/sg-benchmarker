require 'avatar'

class UsersController < ApplicationController
    load_and_authorize_resource :user

    def show
      @avatars = Avatar.all
    end

    def account_info
    end  
end
  