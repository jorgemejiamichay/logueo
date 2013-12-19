# encoding: utf-8
class SessionsController < ApplicationController

  def index
  end

  def create
    if login(params[:username], params[:password])
      redirect_back_or_to root_path
      @@paso = false
    else
      render :index
      flash["alert-danger"] = "Usuario o contraseña inválidos"
      @@paso = false
    end
  end

  def destroy
    logout
    @@paso = false
    redirect_to action: :index
    flash["alert-success"] = "Has cerrado sesión"
  end

end
