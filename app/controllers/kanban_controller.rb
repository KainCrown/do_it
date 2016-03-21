class KanbanController < ApplicationController
  def index
    @do_tasks = Task.do
    @in_progress_tasks = Task.in_progress
    @in_pr_tasks = Task.in_pr
    @done_tasks = Task.done
  end
end
