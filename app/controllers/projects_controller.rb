class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create]

  def index
    @projects = if current_user.admin?
      Project.includes(:owner)
    else
      current_user.projects
    end
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def find_project
    @project = if current_user.admin?
      Project.find(params[:id])
    else
      current_user.projects.find(params[:id])
    end
  end

  def project_params
    params.require(:project). permit(:name, :describe, :owner_id, tasks_attributes: task_params)
  end

  def task_params
    [:id, :title, :describe, :executor_id, :assigner_id, :_destroy, :state, :tag_list]
  end
end
