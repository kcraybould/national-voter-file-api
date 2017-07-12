defmodule NationalVoterFile.VoterReportFact do
  use NationalVoterFile.Web, :model
  use Ecto.Schema

  ## Okay, so Elxir requires the models to match the databases, so my previous scheme of making the 
  ## json model then loading the data from a SQL query is now an ex-parrot.  This is apparently
  ## the Elixir way.  Once we have the data, we will use a view to convert the models into 
  ## the specified json.  I could, in theory, do this with Poison right in the controller
  ## but the view paradigm gives me the power to setup different views of the same data more easily
  ## (and forgive me father, for I have sinned.  I used paradigm non-ironically ...)
  
  ## The schema for the voter_fact_report table
  # This table links the various pieces of voter informaiton together.
  #  Essentially, this is just a list of keys to the real voter information
  # as a practival matter, they voter_report_id and the voter_id in this table are the same
  # but I do not know of any guarentee of that, so I feel compelled to use the get_by in order to find
  # the voter_id when we do the check

  ## Set up the primary key
  # Ecto expects id as the key all the time, so we must inform it of the reality
  @primary_key {:voter_report_id, :id, autogenerate: false}

  ## Now the schema.  Not all of this will use immediately, but since this is the priamry means of accessing the data
  # we should make the model complete absent compelling reasons to do otherwise
  schema "voter_report_fact" do
      field :voter_report_date, Ecto.Date
      field :date_key, :integer
      field :report_status, :string
      field :voter_key, :integer
      field :household_key, :integer
      field :mailing_address_key, :integer
      field :social_media_account_key, :integer
      field :party_key, :integer
      field :precinct_key, :integer
      field :county_key, :integer
      field :ward_key, :integer
      field :congressional_dist_key, :integer
      field :county_district_key, :integer
      field :state_key, :integer
      field :lower_house_dist_key, :integer
      field :upper_house_dist_key, :integer
      field :unified_school_dist_key, :integer
      field :staffer_key, :integer
      field :campaign_key, :integer 
      
      belongs_to :voter, NationalVoterFile.Voter, [foreign_key: :voter_id, define_field: false]
      belongs_to :party, NationalVoterFile.Party, [foreign_key: :party_id, define_field: false]
  end
end