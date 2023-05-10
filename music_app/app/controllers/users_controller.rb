class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:show]

    def create
        # debugger
        @user = User.new(user_params)
        if @user.save!
            login!(@user)
            redirect_to user_url(@user.id)
        else
            render :new
        end
    end

    def new
        # debugger
        @user = User.new
        render :new
    end

    def show
        # debugger
        @user = User.find_by(id: params[:id])
        render :show
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
