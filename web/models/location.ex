defmodule NationalVoterFile.Location do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
      field :latitude, :float
      field :longitude, :float
      field :accuracy
  end

  def changeset(struct, data) do
      struct
      |> cast(data, [:latitude, :longitude, :accuracy])
  end
end