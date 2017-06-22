class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        skills = Skill.where(user_id: params[:id]).group(:name).count
        #skills = Skill.where(user_id: params[:id])
        @skills = skills.sort_by{|skill,count| -count}
        @new_skill = Skill.new
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to user_url(@user)
        else
            render 'new'
        end
    end

    private
        def user_params
              params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
