class HomeController < ApplicationController
  def index
    render :layout => 'layouts/blank_body_with_navbar'
  end
end
