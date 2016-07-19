class UsersController < ApplicationController

  def status
    if whoami
      render text: @user.username
    else
      render nothing: true, status: :unauthorized
    end
  end

  def login
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:uid] = user.id
      render text: user.username
    else
      render nothing: true, status: :unauthorized
    end
  end

  def logout
    session[:uid] = nil
    render nothing: true, status: :ok
  end
end
