class KanbanController < ApplicationController
  layout 'project'
  def index
    @tasks = Task.all
  end
end
