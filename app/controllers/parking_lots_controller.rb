class ParkingLotsController < ApplicationController

  before_filter :authenticate_user!
  def index
    @parking_lots = ParkingLot.all
  end

  def new
    @parking_lot = ParkingLot.new
    @districts = District.all
  end
  
  def show
    @parking_lot = ParkingLot.find(params[:id])
  end

  def create
    parking_lot = ParkingLot.new(params_parking_lot)
    parking_lot.save
    redirect_to :action => :index
  end

  def edit
    @parking_lot = ParkingLot.find(params[:id])
  end

  def update
    parking_lot = ParkingLot.find(params[:id]).update_attributes(params_parking_lot)
    redirect_to :action => :index
  end

  def destroy
    parking_lot = ParkingLot.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_parking_lot
    params.require(:parking_lot).permit(
      :name, :description, :price, :opening_time, :closing_time, :user_id, :district_id, :has_security_cameras, :has_security_alarms, :has_security_persons, :has_supermarkets_close, :has_restaurants_close, :has_cinemas_close
    )
  end
end
