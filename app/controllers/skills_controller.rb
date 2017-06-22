class SkillsController < ApplicationController
    def create
        stored_skills = Skill.where(user_id: params[:skill][:user_id],
                                    from_user_id: session[:user_id]
                                   )
        @user = User.find(params[:skill][:user_id])
        if stored_skills.empty?
            @skill = Skill.new(name: params[:skill][:name], 
                               user_id: params[:skill][:user_id],
                               from_user_id: session[:user_id],
                               )

            if @skill.save
                redirect_to user_url(@user)
            else
                redirect_to user_url(@user)
            end
        else
            redirect_to user_url(@user)
        end
    end
end
