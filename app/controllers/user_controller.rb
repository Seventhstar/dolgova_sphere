class UserController < ApplicationController
  before_action :set_course, only: [:show]

  def show
  end

  private 
    def set_user
      @user = User.find(params[:id])
    end

end