class TasksController < ApplicationController

  private

  def task_params
    params.require(:task).permit(:title, :describe, :tag_list => [])
  end

end
