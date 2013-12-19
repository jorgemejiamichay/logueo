class HomeController < ApplicationController
  before_action :require_login

  def index
    @pregunta = current_user.questions.sample
  end

  def create
    if Question.find(params[:pregunta]).respuesta == params[:respuesta] and current_user.fruit.nombre == params[:fruta]
      @@paso = true
      redirect_to banca_index_url
      flash["alert-success"] = "Ahora estás dentro"
    else
      logout
      redirect_to login_path
      flash["alert-warning"] = "No coincide tu información. Iniciar sesión nuevamente"
      @@paso = false
    end
  end

end
