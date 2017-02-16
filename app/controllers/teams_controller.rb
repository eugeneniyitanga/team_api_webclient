class TeamsController < ApplicationController

  def show
    # @team = Unirest.get("http://localhost:3000/teams/#{params[:id]}.json").body
    @team = Unirest.get("http://localhost:3000/api/v2/teams/#{params[:id]}.json").body
  end
  
  def index
    @teams = Unirest.get("http://localhost:3000/api/v2/teams.json").body
  end
  
  # def create
  #   @team = Unirest.post("http://localhost:3000/teams.json", :headers => {"Accept"=> "application/json"}, :parameters => {:creature => params[:creature], :name => params[:name], :state=> params[:state], :sport => params[:sport]}).body
 
  #    redirect_to :index
  #     @team = Unirest.post("http://localhost:3000/api/v1/teams.json", :headers => {"Accept"=> "application/json"}, :parameters => {:creature => params[:creature], :name => params[:name], :state=> params[:state], :sport => params[:sport]}).body
  #   redirect_to "/teams/#{@team['id']}"
  # end

end
