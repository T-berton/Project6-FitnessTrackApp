class ActivitiesController < ApplicationController
    before_action :authenticate_user!

    def index
        @activities = Activity.all
    end

    def edit
        @activity = Activity.find(
        params[:id]
        )
    end


    def show
        @activity = Activity.find(
        params[:id]
        )
    end


    private 
    def activity_params 
        params.require(:activity).permit(:name,:description,:image)
    end 
    
end
