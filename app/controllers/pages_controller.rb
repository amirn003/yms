class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def incomes
    @bookings = Booking.all
    @yachts = Yacht.all
  end
end
