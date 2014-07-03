class Nominee

  attr_reader :attr

  def self.by(year)
    data_dir = Padrino.root('data', year.to_s)
    return [] unless File.exist?(data_dir)
    Dir[File.join(data_dir, '*.yaml')].map do |yaml_file|
      new(yaml_file)
    end
  end

  def initialize(yaml_file)
    @attr = YAML.load_file(yaml_file)
    @attr.merge(id: File.basename(yaml_file, '.yaml'))
    @attr = @attr.with_indifferent_access
  end

  def [](key)
    @attr[key].to_s.html_safe
  end

end
