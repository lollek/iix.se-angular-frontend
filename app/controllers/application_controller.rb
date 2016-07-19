class ApplicationController < ActionController::Base
  def angular
    render 'layouts/application'
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def whoami
    if session[:uid]
      @user = User.find(session[:uid])
    else
      @user = nil
    end
  end

  def auth!
    render nothing: true, status: :forbidden unless whoami
  end

end
