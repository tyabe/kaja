# coding: utf-8
require 'csv'

class Nominee
  include ActiveAttr::Model

  attribute :name
  attribute :github
  attribute :twitter
  attribute :image_file
  attribute :profile
  attribute :supplement
  attribute :community
  attribute :description
  attribute :judged_by
  attribute :reason_for
  attribute :comment

  class << self
    def of(award)
      nominees = []
      csv_file = File.expand_path(File.join(Padrino.root, "db/kaja_#{award}.csv"))
      if File.exist?(csv_file)
        CSV.foreach(csv_file,
                    headers: true,
                    header_converters: lambda{|h| h.underscore}
                   ) do |row|
          nominees << self.new(row.to_hash)
        end
      end
      nominees
    end
  end

end
