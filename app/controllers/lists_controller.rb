class ListsController < ApplicationController
  def index
    render template: 'lists/index.html.erb', locals: {
      lists: List.all,
    }
  end

  def show
    if List.exists?(params[:id])
      render template: 'lists/show.html.erb', locals: {
        tasks: Task.where(id: params[:id]),
        list: List.find(params[:id]),
      }
    else
      render html: "Not Found", status: 404
    end
  end

  def new
    render locals: {
      list: List.new
    }
  end

  def create
    list = List.new
    list.name = params[:list][:name]
    if list.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be created due to errors."
      render template: 'lists/new.html.erb', locals: {
        list: list,
        tasks: Task.all.order(created_at: :desc)
      }
    end
  end

  def edit
    render locals: {
      list: List.find(params[:id])
    }
  end

  def update
    list = List.find(params[:id])
    list.name = params[:list][:name] if params[:list][:name].present?
    if list.save
      redirect_to root_path
    else
      flash[:alert] = "Could not be edited due to errors."
      render template: 'list/edit.html.erb', locals: {
        list: list,
      }
    end
  end
end
