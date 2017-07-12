defmodule NationalVoterFile.Voter do
  use NationalVoterFile.Web, :model
  use Ecto.Schema

  ## Okay, so Elxir requires the models to match the databases, so my previous schem of making the 
  ## json model then loading the data from a SQL query is now an ex-parrot.  This is apparently
  ## the Elixir way.  Once we have the data, we will use a view to convert the models into 
  ## the specified json.  I could, in theory, do this with Poison right in the controller
  ## but the view paradigm gives me the power to setup different views of the same data more easily
  ## (and forgive me father, for I have sinned.  I used paradigm non-ironically ...)
  
  ## The schema for the voter_dim data base
  # set up the primary key
  # for this, its voter_id, and we associate it with the defualt Ecto key, :id
  @primary_key {:voter_id, :id, autogenerate: true}

  #don't need all these fields today, but likely will in the future, so in they go.
  # also, this code should be generated.  Need a db dump to models code generator
  schema "voter_dim" do
      field :person_key, :integer
      field :state_voter_ref, :string
      field :county_voter_ref, :string
      field :title, :string
      field :first_name, :string
      field :middle_name, :string
      field :last_name, :string
      field :name_suffix, :string
      field :gender, :string
      field :race, :string
      field :birthdate, Ecto.Date
      field :birth_state, :string
      field :registration_date, Ecto.Date
      field :registration_status, :string
      field :abstentee_type, :string
      field :email, :string
      field :phone, :string
      field :do_not_call_status, :boolean
      field :language_choice, :string
      field :version, :integer
      field :valid_from, Ecto.Date
      field :valid_to, Ecto.Date
      many_to_many :party, NationalVoterFile.Party,  
                   join_through: NationalVoterFile.VoterReportFact,
                   join_keys: [voter_key: :voter_id, party_key: :party_id]
  end

end