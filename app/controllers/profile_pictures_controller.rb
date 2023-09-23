class ProfilePicturesController < ApplicationController
  def create
    old_profile_pic = ProfilePicture.where(user_id: current_user.id)

    # create a new profile picture if none exists
    if old_profile_pic.empty?
      ProfilePicture.create(
        avatar_id: params[:avatar_id],
        user_id: current_user.id
      )
    # or update the old one
    else
      ProfilePicture.update(old_profile_pic.first.id, avatar_id: params[:avatar_id])
    end

    flash[:notice] = 'Avatar updated';
    redirect_back fallback_location: root_path
  end
end
