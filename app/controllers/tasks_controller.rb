class TasksController < ApplicationController
  def show
  end

  private

  def task_params
    params.require(:task).permit(:title, :describe, :tag_list => [])
  end
end
