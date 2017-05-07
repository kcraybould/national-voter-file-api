defmodule NationalVoterFile.Phone do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
      field :primary, :boolean
      field :number
      field :number_type
      field :extension
      field :description
      field :operator
      field :country
      field :sms_capable, :boolean
      field :do_not_call, :boolean
  end

  def changeset(struct, data) do
      struct
      |> cast(data, [:primary, :number, :number_type, :extension, :description, :operator, :country, :sms_capable, :do_not_call])
  end
end