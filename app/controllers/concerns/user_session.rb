module Concerns
  module UserSession
    def self.included base
      base.class_eval do
        helper_method :logged_in?
        helper_method :current_user
      end
    end

    def signin_user user
      session[:user_id] = user.id
    end

    def logout
      session[:user_id] = nil
    end

    def current_user
      if logged_in? 
        @current_user ||= User.find(session[:user_id])
      else
        nil
      end
    end

    def logged_in?
      !!session[:user_id]
    end
  end
end