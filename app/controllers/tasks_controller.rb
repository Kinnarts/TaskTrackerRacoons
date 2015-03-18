class TasksController < ApplicationController
  before_action :find_project, only: [:new, :show, :edit, :create, :update, :destroy]
  before_action :find_task, only: [:show, :edit, :update, :destroy, :set_state_event]

  def index
  end

  def edit
  end

  def show
  end

  def update
    if @task.update(task_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def new
  end

  def set_state_event
    @task.state_event = params[:state_event]
    @task.save
    redirect_to :back
  end

  def create
    @task = @project.tasks.new(task_params)
    @task.state_event = "create"
    if @task.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:title, :describe, :executor_id, :assigner_id, :tag_list)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
