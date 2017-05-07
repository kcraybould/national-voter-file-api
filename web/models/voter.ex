# Using schemas and changesets to define the models and convert the json string
# into models.  trying this with pure maps and structs wasn't working well
# This is the base model for the individual voter.
defmodule NationalVoterFile.Voter do
  use NationalVoterFile.Web, :model
  use Ecto.Schema
  import Ecto.Changeset
  
  # use a schema to define the model for the retrieved json
  # XXXXX REMINDER: at type desciptors to the fields when the 
  # code gets to the point it can return for you
  # also, Phoenix could really use a swagger to code generator
  @primary_key false
  embedded_schema do
	  field :origin_system
	  field :created_date
	  field :modified_date
	  field :given_name
	  field :family_name
	  field :honorific_prefix
	  field :honorific_suffix
	  field :additional_name
	  field :gender
	  field :gender_identity
	  field :ethnicities, {:array, :string}
	  field :languages_spoken, {:array, :string}
	  field :party_identification
	  field :source
	  field :employer
	  field :occupation
	  field :identifiers, {:array, :string} # this is weird to me, but the json really is an array of 
	  										# key value pairs
	  # here are pieces of json that can be converted to maps/structs and
	  # embedded into the main json
	  embeds_one :employer_address, NationalVoterFile.Address
	  embeds_many :postal_addresses, NationalVoterFile.Address
	  embeds_many :email_addresses, NationalVoterFile.Email
	  embeds_many :phone_numbers, NationalVoterFile.Phone
	  embeds_many :profiles, NationalVoterFile.Profile
	  embeds_one :custom_fields, NationalVoterFile.CustomFields
	  #embeds_many :_links, NationaVoterFile.Links  # this looks like a one item map inside a map
	   												# its weird to me, so ignore it for now until I can talk
													# to better Elxir people and see if there is a better way
													# of doing this. 
  end

  # if the json comes back in binary format, then decode it
  #XXXX REMINDER: deal with errors
  def from_json(data) when is_binary(data) do
	  Poison.decode!(data) |> from_json
  end

  # once its in non-binary format, rip it apart and stuff it into the various models
  # this concept of different functions based on different conditions is soooooo much nicer than
  # doing a bunch of checks inside one function to figure out what to do, BTW.
  def from_json(data) when is_map(data) do
	  # this transaltes to the module name.  So I think I could write "voter" here
	  # and still have it work, but I see this all over the Elxir/Ecto code so
	  # what the hell, it's probably an 'elxir way' of doing things.  If not, someone will
	  # point it out.
	  %__MODULE__{}
	  |> cast(data, [:origin_system, :created_date, :modified_date, :given_name,
	                :family_name, :honorific_prefix, :honorific_suffix, :additional_name,
					:gender, :gender_identity, :ethnicities, :languages_spoken, 
					:party_identification, :source, :employer, :occupation, :identifiers])
	  |> cast_embed(:employer_address)
	  |> cast_embed(:postal_addresses)
	  |> cast_embed(:email_addresses)
	  |> cast_embed(:phone_numbers)
	  |> cast_embed(:profiles)
	  |> cast_embed(:custom_fields)
	  |> apply_changes
  end

end # We are all done here