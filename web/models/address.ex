defmodule NationalVoterFile.Address do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
      field :primary, :boolean, null: false
      field :address_type
      field :address_lines, {:array, :string}
      field :locality
      field :region
      field :postal_code
      field :country
      field :language
      field :venue, :string, null: false
      embeds_one :location, NationalVoterFile.Location
  end

  def changeset(struct, data) do
      struct
      |> cast(data, [:primary, :address_type, :address_lines, :locality, :language, 
                    :region, :postal_code, :country, :venue])
      |>cast_embed(:location)
  end
end