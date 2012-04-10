class Nomination < ActiveRecord::Base

  # Fields
  field :name
  field :description
  field :contact
  field :kaja
  field :testimonial
  field :github
  field :twitter
  timestamps

  # Validations
  validates_presence_of :name, :kaja

end
