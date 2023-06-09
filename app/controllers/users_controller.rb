class UsersController < ApplicationController
  def show
    unless current_user
      flash[:alert] = 'Sign in required'
      redirect_to new_user_session_path
    end
  end
end
