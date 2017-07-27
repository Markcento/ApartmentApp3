class AdminController < ApplicationController
  before_action :authenticate_user!
   before_action :authorize

   # get "admin"
   def index
     @users = User.all
   end

   # put/patch "admin/:id"
   def update
     user = User.find(params[:id])
     if !current_user.has_role? :admin
       user.remove_role(:admin)
     end
     if !current_user.has_role? :seeker
       user.remove_role(:seeker) 
     end
    user.add_role(:office)
    redirect_to '/admin'
   end

   private

   def authorize
     if !current_user.has_role? :admin
       render plain:"No access for you!"
     end
   end
end
