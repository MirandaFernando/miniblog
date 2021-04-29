class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    
    def after_sign_in_path_for(resource)
        
        if resource.has_role? :admin 
            rails_admin_path
        elsif resource.has_role? :revisor
            posts_path
        else
            posts_path
        end    
    end
  
end
