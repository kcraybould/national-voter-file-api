defmodule NationalVoterFile.Email do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
      field :primary, :boolean
      field :address
      field :address_type
      field :status
  end

  def changeset(struct, data) do
      struct
      |> cast(data, [:primary, :address, :address_type, :status])
  end
end