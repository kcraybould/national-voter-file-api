defmodule NationalVoterFile.VoterController do
  use NationalVoterFile.Web, :controller
  import Ecto.Query

  def show(conn, %{"id" => id}) do

     query = from v in NationalVoterFile.Voter,
             join: p in assoc(v, :party),
             select: v, 
             where: v.voter_id == ^id,
             preload: [party: p]  

    result = Repo.one(query)
    IO.inspect result
  	render conn, "voter.json", voter: result
  end
end
