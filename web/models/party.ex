defmodule NationalVoterFile.Party do
  use NationalVoterFile.Web, :model
  use Ecto.Schema

  @primary_key {:party_id, :id, autogenerate: true}

  schema "party_dim" do
      field :party_code, :string
      field :party_name, :string
      field :version, :integer
      field :valid_from, Ecto.Date
      field :valid_to, Ecto.Date
  end

end