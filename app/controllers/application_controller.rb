class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @@paso = false


  def require_login
    if logged_in?
      true
    else 
      redirect_to login_path
      flash["alert-warning"] = "Necesitas iniciar sesión para ver esto"
      @@paso = false
      false
    end
  end

  def authorize  
    unless @@paso
      redirect_to login_path
      flash["alert-warning"] = "Necesitas validar la información. Inicia sesión nuevamente"
      logout
      @@paso = false
      false  
    end  
  end  

end
