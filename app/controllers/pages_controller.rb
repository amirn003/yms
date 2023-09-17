class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def business
    @bookings = Booking.all
    @yachts = Yacht.all
  end

  def income
    @weekly_income = Income.where('user_id = ? AND date >= ? AND date <= ?', current_user, Date.today.beginning_of_week, Date.today.end_of_week).sum(:amount)
    @monthly_income = Income.where('user_id = ? AND date >= ? AND date <= ?', current_user, Date.today.beginning_of_month, Date.today.end_of_month).sum(:amount)
    @yearly_income = Income.where('user_id = ? AND date >= ? AND date <= ?', current_user, Date.today.beginning_of_year, Date.today.end_of_year).sum(:amount)
  end

  def calendar

  end
end
