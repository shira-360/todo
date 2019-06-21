class TasksController < ApplicationController
    def index
        @tasks = Task.order('id DESC')
    end
    
    def new
        @task = Task.new
        @users = User.all
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def create
        Task.create(task_params)
        redirect_to controller: :tasks, action: :index
    end
    
    def destroy
        task = Task.find(params[:id])
        task.destroy
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        task = Task.find(params[:id])
        task.update(task_params)
    end
    
    private
    def task_params
        params.require(:task).permit(:title)
    end
end
