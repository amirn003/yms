class CrewController < ApplicationController
  before_action :authenticate_user!

  def new
    @crew = Crew.new
  end

  def create
    @crew = Crew.new(crew_params)
    if @crew.save
      redirect_to @crew, notice: 'Crew created'
    else
      render :new
    end
  end

  def assign_user
    @crew = Crew.find(params[:id])
    @user = User.find(params[:user_id])

    if @crew.users << @user
      redirect_to @crew, notice: 'User added to the crew!'
    else
      redirect_to @crew, alert: 'Impossible to add the user!'
    end
  end

  def crew_params
    params.require(:crew).permit(:name)
  end

end
