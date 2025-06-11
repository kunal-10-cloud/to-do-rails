class TasksController < ApplicationController
    before_action :set_task, only: [ :update, :destroy ]

    def index
      @tasks = Task.all.order(created_at: :desc)
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    end

    def update
      @task.update(completed: !@task.completed)
      redirect_to root_path
    end

    def destroy
      @task.destroy
      redirect_to root_path
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
