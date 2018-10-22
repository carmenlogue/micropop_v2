class AdminController < ApplicationController
  before_action :authenticate_user!

  layout 'admin'

  def index
    redirect_to admin_poems_path
  end
end
