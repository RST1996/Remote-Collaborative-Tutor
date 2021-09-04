class PagesController < ApplicationController
	skip_before_action :authenticate_user!, :only => [:about]
  def dashboard
  end

  def index
  	redirect_to pages_dashboard_url
  end

  def about
  end

  def vdl
  end
end
