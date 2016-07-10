class ApplicationController < ActionController::Base
  def angular
    render 'layouts/application'
  end

  def not_found
    redirect_to '/404'
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
