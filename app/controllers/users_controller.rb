class UsersController < ApplicationController
      before_action :require_logged_in, except: [:index, :new, :create]

     def index
     end

     def show #will be for user even without session

      # @user = User.find(params[:id])
     end

     def new
      @user = User.new
     end

     def profile #will show the profile details 
     end

     def edit_profile #show edit form and get the new values
      @profile = User.find(current_user.id)
     end

     def update
      @profile = User.find(params[:id])
      @profile.update(user_params)
      
     end

     def create
         @user = User.create(user_params)  

         if @user.save
            session[:user_id] = @user.id 
            redirect_to controller: 'searches', action: 'home'
         else
            redirect_to controller: 'users', action: 'new'
         end
     end

     private 
     def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email, :city, :state, :bio) 
     end

end
