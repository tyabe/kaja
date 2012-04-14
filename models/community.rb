class Community < ActiveRecord::Base

  # Fields
  field :name
  field :description
  field :contact
  timestamps

  # Validations
  validates_presence_of :name

end
