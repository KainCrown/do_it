class ProjectsController < ApplicationController
  layout 'project'

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
    @project = Project.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = 'Success'
    else
      flash[:danger] = 'Failed'
    end
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
