defmodule NationalVoterFile.Identifier do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
      field :national_voter_file
      field :foreign_system
  end

  def changeset(struct, data) do
      struct
      |> cast(data, [:national_voter_file, :foreign_system])
  end
end