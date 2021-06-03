class ProjectsController < ApplicationController
  before_action :set_project, only: :show


  def index
    @projects = Project.active
  end

  def show
    @project
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end
end
