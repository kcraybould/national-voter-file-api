defmodule NationalVoterFile.VoterView do
    use NationalVoterFile.Web, :view

    def render("voter.json", %{voter: voter}) do
        %{
            id: voter.voter_id,
            party_indentification: hd(voter.party).party_name
        }
    end
end