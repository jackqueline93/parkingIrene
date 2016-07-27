class MainController < ApplicationController
  before_filter :authenticate_user!
  def index
    @districts = District.all
  end
end