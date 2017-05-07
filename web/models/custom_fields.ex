defmodule NationalVoterFile.CustomFields do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
      field :is_volunteer
      field :most_important_issue
      field :union_member
  end

  def changeset(struct, data) do
      struct
      |> cast(data, [:is_volunteer, :most_important_issue, :union_member])
  end
end