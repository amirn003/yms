class YachtsController < ApplicationController

  def index
    @yachts = Yacht.all
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    @yacht.user = current_user
    if @yacht.save
      redirect_to yachts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_yachts
    @yachts = Yacht.where(user: current_user)
    render :index
  end

  def show
    @yacht = Yacht.find(params[:id])
  end

  private

  def yacht_params
    params.require(:yacht).permit(:id,:name, :number_of_guests, :price, :location)
  end
end
