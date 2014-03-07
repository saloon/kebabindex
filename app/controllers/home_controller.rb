class HomeController < ApplicationController
  def index
  end

  def version
    render json: {version: '0.0.1'}
  end
end
