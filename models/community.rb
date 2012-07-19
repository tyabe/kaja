class Community < ActiveRecord::Base

  # Fields
  field :name
  field :description, as: :text
  field :email
  timestamps

  # Validations
  validates_presence_of :name, :description, :email

end
