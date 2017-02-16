class TeamsController < ApplicationController

  def show
    @team = Unirest.get("#{ENV['DOMAIN']}/teams/#{params[:id]}.json").body
  end
  
  def index
    @teams = Unirest.get("#{ENV['DOMAIN']}/teams.json").body
  end
  
  def new 
    
  end

  def create
      @team = Unirest.post("#{ENV['DOMAIN']}/teams.json", :headers => {"Accept"=> "application/json"}, :parameters => {:creature => params[:creature], :name => params[:name], :state=> params[:state], :sport => params[:sport]}).body 
    redirect_to "/teams/#{@team['id']}"
  end

  def edit 
    @team = Unirest.get("#{ENV['DOMAIN']}/teams/#{params[:id]}.json").body
    
  end

  def update 
    @team = Unirest.patch("#{ENV['DOMAIN']}/teams.json", :headers => {"Accept"=> "application/json"}, :parameters => {:creature => params[:creature], :name => params[:name], :state=> params[:state], :sport => params[:sport]}).body
    redirect_to "/teams/#{@team['id']}"
    
  end

  def destroy
    Unirest.delete("#{ENV['DOMAIN']}/teams/#{params[:id]}.json").body
    redirect_to "/teams"
  end
end
