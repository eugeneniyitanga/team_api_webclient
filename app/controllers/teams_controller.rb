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
    @team = Team.new({:creature => params[:creature], :name => params[:name], :state => params[:state], :sport => params[:sport]})
    redirect_to "/teams/#{@team.id}"
  end

  def edit 
    @team = Unirest.get("#{ENV['DOMAIN']}/teams/#{params[:id]}.json").body
  end

  def update 
    @team = Unirest.patch("#{ENV['DOMAIN']}/teams.json", :headers => {"Accept"=> "application/json"}, :parameters => {:creature => params[:creature], :name => params[:name], :state=> params[:state], :sport => params[:sport]}).body
    redirect_to "/teams/#{@team['id']}"
  end

  def destroy
    Team.delete(:id)
    redirect_to "/teams"
  end
end
