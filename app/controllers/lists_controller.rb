class ListsController < ApplicationController
  def index
    render template: 'lists/index.html.erb', locals: {
      lists: List.all,
    }
  end
end
