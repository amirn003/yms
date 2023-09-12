class YachtsController < ApplicationController

  def index
    @yachts = Yacht.all
  end

  def my_yachts
    @yachts = Yacht.where(user: current_user)
    render :index
  end

  def show
    @yacht = Yacht.find(params[:id])
  end
end
