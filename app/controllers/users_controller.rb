class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_login, :except => [:new, :create]
    before_action :admin, :only => :index
    
    def admin
      current_user and current_user.admin
    end

    def index
    @users = User.all
  end
  def new
    @user = User.new
    @user.questions.build
    @user.build_fruit
  end
 def show
  end
  def edit
  end
   def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { 
          redirect_to users_url 
          flash["alert-success"] = "Usuario editado!"
        }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_url
      flash["alert-success"] = "Has creado la cuenta satisfactoriamente"

    else
      render :new
    end
  end
    def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def set_user
      @user = User.find(params[:id])
    end

  def user_params
      params.require(:user).permit :username,
                                   :admin,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   questions_attributes: [:id, :pregunta, :respuesta],
                                   fruit_attributes: [:id, :nombre]
  end
end
