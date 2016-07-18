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
end
