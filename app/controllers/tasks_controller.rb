class TasksController < ApplicationController
  def index
    render template: 'tasks/index.html.erb', locals: {
      lists: List.all,
      tasks: Task.where(id: params[:list_id]),
      list: List.where(id: params[:list_id])
    }
  end

  def show
    render template: 'tasks/show.html.erb', locals: {
      tasks: Task.find(params[:list_id])
    }
  end

  
end
