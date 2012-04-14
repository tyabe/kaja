class Nomination < ActiveRecord::Base

  # Fields
  field :name
  field :testimonial
  field :github
  field :twitter
  timestamps

  # Validations
  validates_presence_of :name

end
