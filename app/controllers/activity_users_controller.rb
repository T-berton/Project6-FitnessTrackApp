class ActivityUsersController < ApplicationController
    before_action :authenticate_user!
    def new
        @activities = Activity.all
        @activity_user = ActivityUser.new
    end 

    def edit
        @activity_user = ActivityUser.find(params[:id])
        @activity = @activity_user.activity
        @activities = Activity.all

    end

    def update
        @activity_user = ActivityUser.find(params[:id])
        if @activity_user.update(activity_user_params)
            redirect_to :activity_user_index
        else 
            render :edit
        end
    end

    def destroy
        @activity_user = ActivityUser.find(params[:id])
        if @activity_user.destroy
            flash[:success] = 'Activity was successfully deleted.'
            redirect_to :activity_user_index
        else
            flash[:error] = 'Something went wrong'
            redirect_to :activity_user_edit
        end
    end
    

    def create 
        @activity_user = ActivityUser.new(activity_user_params)
        if @activity_user.save 
            redirect_to :activity_user_index
        else 
            render :new
            puts @activity_user.errors.full_messages
        end 
    end 

    def index
        @activity_users = current_user.activity_users
    end 
    private
        def activity_user_params 
            params.require(:activity_user).permit(:activity_id,:user_id,:duration,:date)
        end
end
