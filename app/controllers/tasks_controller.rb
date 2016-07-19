class TasksController < ApplicationController
  def index
    render template: 'tasks/index.html.erb', locals: {
      tasks: Task.where(list_id: params[:list_id]),
      list: List.find(params[:list_id])
    }
  end

  def show
    render template: 'tasks/show.html.erb', locals: {
      tasks: Task.where(id: params[:id]),
      task: Task.find(params[:id]),
      list: List.find(params[:list_id])
    }
  end

  def new
    render locals: {
      task: Task.new,
      list: List.find(params[:list_id])
    }
  end

  def create
    task = Task.new
    task.list_id = params[:task][:list_id]
    task.position = Task.count + 1
    if task.save
      redirect_to list_task_path(params[:list_id], task)
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'tasks/new.html.erb', locals: {
      }
    end
  end

  def edit
    render locals: {
      task: Task.find(params[:id])
    }
  end

  def update
    task = Task.find(params[:id])
    task.list_id = params[:task][:list_id]
    task.body = params[:task][:body]
    task.complete = params[:task][:complete]
    task.position = params[:task][:position]
    if task.save
      redirect_to list_task_path(params[:list_id], task)
    else
      render template: "/task/edit.html.erb", locals: {
        task: task
      }
    end
  end

  def destroy
    task = Task.find(params[:list_id])
    task.destroy
    redirect_to root_path, :notice => "Your task has been deleted"
  end
end
