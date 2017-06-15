class ActionsController < ApplicationController
def index
    @actions = Action.all.order(:title)
  end

  def show
    @action = Action.find(params[:id])
  end

  def new
    @action = Action.new
    @actions = Action.all 
  end

  def create
    Action.create(action_params)
    redirect_to actions_path
  end

  def destroy
    @action_to_delete = Action.find(params[:id])
    @action_to_delete.matters.clear
    @action_to_delete.delete
    redirect_to actions_path
  end

  def update
    Action.find(params[:id]).update(action_params)
    redirect_to matters_path
  end


  private

  def action_params
    params.require(:action).permit(:title, :description, :open, :completed, :duration, :location, :matter_ids => [])
  end

end
