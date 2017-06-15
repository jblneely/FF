class MattersController < ApplicationController
def index
  	@matters = Matter.all.order(:title)
  end

  def new
  	@matter = Matter.new
  	@actions = Action.all.order(:title)

  end

  def edit
    @matter = Matter.find(params[:id])
  end

  def show
  	@matter = Matter.find(params[:id])
  end

  def create
  	Matter.create(matter_params)
  	redirect_to matters_path
  end

  def destroy
  	@matter_to_delete = Matter.find(params[:id])
  	@matter_to_delete.actions.clear
  	@matter_to_delete.delete
  	redirect_to matter_path
  end

  def update
    Matter.find(params[:id]).update(matter_params)
    redirect_to matters_path
  end


  private

  def matter_params
  	params.require(:matter).permit(:title, :description, :open, :close, :due, :action_ids => [])
  end
end
