class Team 

  
  attr_accessor :id, :creature, :name, :state, :sport 

  def initialize(hash)
    @id = hash['id']
    @creature = hash['creature']
    @name = hash['name']
    @state = hash['state']
    @sport = hash['sport']
  end 

  def self.find(id)
    team_hash = Unirest.get("#{ENV['DOMAIN']}/teams/#{id}.json").body
     Team.new(team_hash)    
  end 

  def self.all 
    team_hashes = Unirest.get("#{ENV['DOMAIN']}/teams.json").body
    teams = []
    team_hashes.each do |team_hash|
      teams << Team.new(team_hash)
    end
    return teams     
  end

  def self.create  
    team_hash = Unirest.post("#{ENV['DOMAIN']}/teams.json", :headers => {"Accept"=> "application/json"}, :parameters => {:creature => params[:creature], :name => params[:name], :state=> params[:state], :sport => params[:sport]}).body 
  end 

  def self.delete(id)
    Unirest.delete("#{ENV['DOMAIN']}/teams/#{id}.json").body
  end 

end 