class UsersController < ApplicationController
  def show
    set_user

    unless current_user
      flash[:alert] = 'Sign in required'
      redirect_to new_user_session_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
