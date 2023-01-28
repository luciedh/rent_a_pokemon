class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_bookings = Booking.where(user_id: @user.id)
    @my_team = Pokemon.where(user_id: @user.id)
    @my_team_attack_points = @my_team.pluck(:attack).sum
    @my_team_defense_points = @my_team.pluck(:defense).sum
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user])
  end
end
