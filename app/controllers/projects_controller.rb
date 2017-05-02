class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @project = Project.where({ category: project_params[:category] })
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.picture = "default.png"  if project_params[:picture].nil?
    @project.user = current_user
    if @project.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:user_id, :role_id)
  end
end
