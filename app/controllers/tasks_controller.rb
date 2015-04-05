class TasksController < ApplicationController
	def show
		@task = Task.find(params[:id])
	end

	def new
		@task = Task.new
		render 'redirect'
	end

	def edit
		@task = Task.find(params[:id])
		render 'redirect'
	end

	def create
		@task = Task.create(task_params)
    	@task.user = current_user
    	authorize! :create, @task
		if @task.save
			@tasks = Task.accessible_by(current_ability)
      		redirect_to home_index_path
    	else
			render 'new'
    	end
	end	

	def update
		@task = Task.find(params[:id])
		@task.assign_attributes(task_params)
		authorize! :update, @task
		if @task.update(Task_params)
			@tasks = Task.accessible_by(current_ability)
			redirect_to home
		else
			render 'edit'
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to home_index_path
	end
	private
	def task_params
		params.require(:task).permit(:title, :note,
			:completed, :completed_on)
	end
end
