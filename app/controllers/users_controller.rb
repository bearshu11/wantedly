class UsersController < ApplicationController
    before_action :logged_in_user, only: [:show, :create, :index]
    
    def index
        @users = User.all
    end

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
        
        def logged_in_user
            unless logged_in?
             redirect_to login_url
            end
        end

end
