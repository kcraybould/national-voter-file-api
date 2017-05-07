defmodule NationalVoterFile.Repo do
  #use Ecto.Repo, otp_app: :national_voter_file
  use NationalVoterFile.Web, :model
  

 # def all(NationalVoterFile.Voter) do
  #	[%NationalVoterFile.Voter{id: "1", name: "Voter McVoterson", registered: "no"},
  #	%NationalVoterFile.Voter{id: "2", name: "That Person", registered: "yes"},
  #	%NationalVoterFile.Voter{id: "3", name: "You And You", registered: "yes"}]
  # end

  def get(module, id) do
  	#Enum.find all(module), fn map -> map.id == id end
    
    ##temprary to work with until I figure out the DB situation
    #let's go read the file!
    json_file = "test/voters/1.json"
    binary = json_file |> File.read!
    data = binary |> Poison.decode!
    module.from_json(data)
  end

end
