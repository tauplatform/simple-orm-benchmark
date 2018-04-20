# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class FixedSchemeModel
  include Rhom::FixedSchema

  # Uncomment the following line to enable sync with FixedSchemeModel.
  # enable :sync

  #add model specific code here
  property :name, :string
  property :status, :integer
end
