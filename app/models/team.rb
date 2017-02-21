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
    team_hash = Unirest.get("#{ENV['DOMAIN']}/teams/#{id}.json",headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL']}).body
     Team.new(team_hash)    
  end 

  def self.all 
    team_hashes = Unirest.get("#{ENV['DOMAIN']}/teams.json", :headers => {"Accept"=> "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL']}).body
    teams = []
    team_hashes.each do |team_hash|
      teams << Team.new(team_hash)
    end
    return teams     
  end

  def self.create(params)
    team_hash = Unirest.post("#{ENV['DOMAIN']}/teams.json", :headers => {"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "X-User-Email"=> ENV['API_EMAIL']}, :parameters => params).body
    @team = Team.new(team_hash)

  end 

  def destroy 
    team_hash = Unirest.delete("#{ENV['DOMAIN']}/teams/#{id}.json").body
  end 

  def edit(id)
  team_hash = Unirest.get("#{ENV['DOMAIN']}/teams/#{id}.json").body
    @team = Team.new(team_hash) 
  end 

  def update(params)
    @team_hash = Unirest.patch("#{ENV['DOMAIN']}/teams/#{id}.json", :headers => {"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "X-User-Email"=> ENV['API_EMAIL']}, :parameters => params).body
    team = Team.new(@team_hash)
  end 
end 