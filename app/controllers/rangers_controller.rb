class RangersController < ApplicationController
  def index
  	@rangers = Ranger.all.order(:name)
  end

  def show
  	@ranger = Ranger.find(params[:id])
  end

  def new
  	@ranger = Ranger.new
  	@parks = Park.all 
  end

  def create
  	Ranger.create(ranger_params)
  	redirect_to rangers_path
  end

  private

  def ranger_params
  	params.require(:ranger).permit(:name, :park_ids => [])
  end


end
