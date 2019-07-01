class TasksController < ApplicationController
    protect_from_forgery
    before_action :move_to_index, except: :index
    
    def index
        @tasks = Task.includes(:users).order('id DESC').page(params[:page]).per(5)
        @users = User.all
        @check = TasksUser.new
    end
    
    def new
        @task = Task.new
        @users = User.all
    end
    
    def show
        @task = Task.find(params[:id])
        @comments = @task.comments.includes(:user)
    end
    
    def create
        Task.create(task_params)
        redirect_to root_path
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
    
    def check_update
        @task = Task.update.find(params[:id])
        params.require(:tasks_users).permit(:checkbox[])
    end
    
    private
    def task_params
        user_id = User.all.map{|user| user.id}
        
        params.require(:task).permit(:name, :title).merge(user_ids: user_id)
        
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
end
