class RentsController < ApplicationController

  before_filter :authenticate_user!
  def index
    @rents = Rent.all
  end

  def new
    @rent = Rent.new
    @parking_lots = ParkingLot.all
  end
  
  def show
    @rent = Rent.find(params[:id])
  end

  def create
    rent = Rent.new(params_rent)
    parking_lot = ParkingLot.find(rent.parking_lot_id)
    rent.total_price = rent.hours*parking_lot.price
    rent.user_id = current_user.id
    rent.save
    redirect_to :action => :index
  end

  def edit
    @rent = Rent.find(params[:id])
  end

  def update
    rent = Rent.find(params[:id]).update_attributes(params_rent)
    redirect_to :action => :index
  end

  def destroy
    rent = Rent.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_rent
    params.require(:rent).permit(
      :description
    )
  end
end
