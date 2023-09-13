class BookingsController < ApplicationController
  before_action :set_yacht, only: [:create, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.yacht = @yacht
    authorize @booking
    authorize @flat

    if @booking.save!
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end


  def update
    authorize @yacht
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Upadated successfully!', status: :see_other
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to root_path, notice: 'Booking was successfully destroyed!', status: :see_other
  end
  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :yacht_id)
  end

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

end
