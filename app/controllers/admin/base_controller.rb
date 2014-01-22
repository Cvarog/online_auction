class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  # def only_for_admin
  #   redirect_to root_path unless current_user.admin?
  # end

  def check_admin
    render text: "У вас нет прав доступа к этой странице" unless current_user.admin?
    false
  end  
end