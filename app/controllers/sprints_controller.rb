class SprintsController < ApplicationController
  layout 'sprint'

  before_action :set_sprint, only: [:show, :edit, :update, :destroy]

  def index
    @sprints = Sprint.all
    @sprint = Sprint.new

    @tasks = Task.all
  end

  def show
  end

  def new
    @sprint = Sprint.new
  end

  def edit
  end

  def create
    params = sprint_params
    task_ids = params.delete(:task_ids)

    @sprint = Sprint.new(params)
    task_ids.each do |id|
      task = Task.find_by(id: id)
      @sprint.tasks << task if task
    end

    if @sprint.save
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to sprints_path
  end

  def update
    params = sprint_params
    task_ids = params.delete(:task_ids)
    @sprint.tasks = []

    task_ids.each do |id|
      task = Task.find_by(id: id)
      @sprint.tasks << task if task
    end

    if @sprint.update(params)
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to sprints_path
  end

  def destroy
    if @sprint.destroy
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to sprints_path
  end

  private
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    def sprint_params
      params.require(:sprint).permit(:start, :end, task_ids: [])
    end
end
