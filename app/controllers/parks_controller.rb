class ParksController < ApplicationController
  def index
  	@parks = Park.all.order(:name)
  end

  def new
  	@park = Park.new
  	@rangers = Ranger.all.order(:name)

  end

  def edit
    @park = Park.find(params[:id])
  end

  def show
  	@park = Park.find(params[:id])
  end

  def create
  	Park.create(park_params)
  	redirect_to parks_path
  end

  def destroy
  	@park_to_delete = Park.find(params[:id])
  	@park_to_delete.rangers.clear
  	@park_to_delete.delete
  	redirect_to parks_path
  end

  def update
    Park.find(params[:id]).update(park_params)
    redirect_to parks_path
  end


  private

  def park_params
  	params.require(:park).permit(:name, :description, :picture, :ranger_ids => [])
  end
end
