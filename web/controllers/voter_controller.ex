defmodule NationalVoterFile.VoterController do
  use NationalVoterFile.Web, :controller

  def show(conn, %{"id" => id}) do
  	voter = Repo.get(NationalVoterFile.Voter, id)
  	#render conn, "show.jsoon", voter: voter
    json conn, voter
  end
end
