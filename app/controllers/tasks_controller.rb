class TasksController < ApplicationController
  before_action :find_project

  def index
    @tasks = @project.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :describe, :executor_id, :assigner_id, :tag_list => [])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
