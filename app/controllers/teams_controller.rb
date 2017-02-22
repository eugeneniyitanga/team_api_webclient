class TeamsController < ApplicationController

  def show 
    @team = Team.find(params[:id])
  end
  
  def index
    @teams = Team.all 
  end
  
  def new 
    
  end

  def create
    @team = Team.create({creature: params[:creature], name: params[:name], state: params[:state], sport: params[:sport]})
    redirect_to "/teams/#{@team.id}"
  end

  def edit 
    @team = Team.find(params[:id])
  end

  def update 
    @team = Team.find(params[:id])
     @team.update({ id: params[:id], creature: params[:creature], name: params[:name], state: params[:state], sport: params[:sport]}) 
    redirect_to "/teams/#{@team.id}"
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:warning] = "Team Deleted!"
    redirect_to "/teams" 
  end
end
