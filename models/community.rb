class Community

  def self.by(year)
    csv_file = Padrino.root("data/#{year}/community.csv")
    return [] unless File.exist?(csv_file)
    CSV.table(csv_file)
  end

end
