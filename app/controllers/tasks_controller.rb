# require "pry-byebug"

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    # binding.pry
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    # raise
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    parameters = params.require(:task).permit(:title, :details, :completed)
    # parameters[:completed] = parameters[:completed] == "1"
    # return parameters
  end
end
