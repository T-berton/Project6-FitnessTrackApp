class ActivitiesController < ApplicationController
    before_action :authenticate_user!

    def index
        @activities = Activity.all
    end
    def new
        @activity = Activity.new
    end
    def edit
        @activity = Activity.find(
        params[:id]
        )
    end
    def update
        @activity = Activity.find(params[:id])
        if @activity.update(activity_params)
            redirect_to show_path(@activity)
        else
            render :edit
        end
    end

    def show
        @activity = Activity.find(
        params[:id]
        )
    end
    def create
        @activity= Activity.new(activity_params)
        if @activity.save 
            redirect_to show_path(@activity)
        else 
            render :new
        end 
    end 

    private 
    def activity_params 
        params.require(:activity).permit(:name,:description,:image)
    end 
    
end
