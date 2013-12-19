class BancaController < ApplicationController
  before_action :require_login
  before_filter :authorize

  def index
  end

end
