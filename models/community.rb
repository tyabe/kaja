class Community < ActiveRecord::Base

  # Fields
  field :name
  field :description, as: :text
  field :email
  field :approval, as: :boolean, default: false
  timestamps

  # Validations
  validates_presence_of :name, :description, :email

  scope :approved, where(approval: true)

  def approved?
    self.approval
  end

end
