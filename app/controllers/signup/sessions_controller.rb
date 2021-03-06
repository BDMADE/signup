require_dependency 'signup/application_controller'

module Signup
  class SessionsController < ApplicationController
    def new
      if logged_in?
        redirect_to main_app.root_path
      end
    end

    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        if (main_app.admin_dashboard_path)
          redirect_to main_app.admin_dashboard_path, notice: 'logged in !'
        else
          redirect_to user, notice: 'logged in !'
        end
      else
        flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end

    end

    def destroy
      log_out if logged_in?
      redirect_to signup.login_path
    end
  end
end
