class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_bookings = Booking.where(user_id: @user.id)
    @my_team = Pokemon.where(user_id: @user.id)
    @my_team_attack_points = 0
    @my_team_attack_points = @my_team.each do |pokemon|
      points = pokemon.attack
      @my_team_attack_points += points
      @my_team_attack_points
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user])
  end
end
