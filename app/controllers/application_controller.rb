class ApplicationController < ActionController::Base
    def after_sign_out_path_for(resource)
        case resource
        when :user   
          new_user_session_path
        when :hospital  
          new_hospital_session_path
        end
     end
end
