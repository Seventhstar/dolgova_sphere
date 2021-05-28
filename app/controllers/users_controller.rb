class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @info = @user&.add_info
  end

  def delete_avatar
    @avatar = ActiveStorage::Attachment.find(params[:id])
    @avatar.purge_later
    redirect_back(fallback_location: request.referer)
  end

  private 
    def set_user
      @user = User.find(params[:id])
    end

end