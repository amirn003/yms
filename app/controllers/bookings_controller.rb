class BookingsController < ApplicationController
  before_action :set_yacht, only: [:new, :create]

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
    # authorize @booking
    # authorize @yacht

    if @booking.save!
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # authorize @booking
    @booking = Booking.find(params[:id])

  end


  def update
    # authorize @yacht
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Upadated successfully!', status: :see_other
    else
      render :edit
    end
  end

  def destroy
    # authorize @booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully destroyed!', status: :see_other
  end
  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out,:total,:agency)
  end

  def set_yacht
    @yacht = Yacht.find(params[:id])
  end

end
