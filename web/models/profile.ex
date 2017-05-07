defmodule NationalVoterFile.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
      field :provider
      field :id
      field :url
      field :handle, :string, null: false
  end

  def changeset(struct, data) do
      struct
      |> cast(data, [:provider, :id, :url, :handle])
  end
end