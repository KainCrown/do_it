class KanbanController < ApplicationController
  def index
    @tasks = Task.all
  end
end
