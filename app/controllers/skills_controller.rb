class SkillsController < ApplicationController
    def create
        @skill = Skill.new(name: params[:skill][:name], 
                           user_id: params[:skill][:user_id],
                           from_user_id: session[:user_id],
                           )
        @user = User.find(@skill.user_id)
        if @skill.save
            redirect_to user_url(@user)
        else
            redirect_to user_url(@user)
        end
    end
end
