class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
    def after_sign_in_path_for(resource)
        case resource
        when User
          tops_path
        when Hospital
          medical_departments_path
      end
    end

    def after_sign_out_path_for(resource)
        case resource
        when :user   
          new_user_session_path
        when :hospital  
          new_hospital_session_path
        end
    end
end
