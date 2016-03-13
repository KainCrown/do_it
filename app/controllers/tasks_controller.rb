class TasksController < ApplicationController
  layout 'task'

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to tasks_path
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to tasks_path
  end

  def destroy
    if @task.destroy
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description)
    end
end
