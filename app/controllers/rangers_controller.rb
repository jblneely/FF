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

  def destroy
    @ranger_to_delete = Ranger.find(params[:id])
    @ranger_to_delete.parks.clear
    @ranger_to_delete.delete
    redirect_to rangers_path
  end

  def update
    Ranger.find(params[:id]).update(ranger_params)
    redirect_to parks_path
  end


  private

  def ranger_params
  	params.require(:ranger).permit(:name, :park_ids => [])
  end


end
