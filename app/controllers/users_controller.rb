class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :like]
    before_action :require_same_user,only: [:edit, :update]
    
    
    def new
       @user = User.new 
    end
    
    def create
        @user = User.new(user_params) 
        if @user.save
            redirect_to events_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    private
        def user_params
            params.require(:user).permit(:email, :name, :last_names, :phone, :password)
        end
        
        def set_user
            @user = User.find(params[:id])
        end
          
        def require_same_user
            if current_user != @user
              flash[:danger]  = "You can only edit your own profile" 
              redirect_to root_path
            end
        end
end