require 'bundler/setup'
require 'padrino-core/cli/rake'

PadrinoTasks.init

desc 'Run tests for all'
task :default => :spec

desc 'Generate profile files of kaja'
task :generate_profiles => :environment do
  require 'csv'
  source_file = Padrino.root('tmp', 'source.csv')
  abort "#{source_file} is not found." unless File.exist?(source_file)

  headers = %w[
    timestamp
    community
    email
    judged_by
    dummy
    comment
    name
    contact
    profile
    reason_for
    github
    twitter
    image
    supplement
  ]
  csv_table = CSV.table(source_file, headers: headers, write_headers: true)
  csv_table.each_with_index do |profile, index|
    next if index == 0

    template = File.read(Padrino.root('data', 'template.yaml.erb'))
    erb = ERB.new(template)

    File.write(Padrino.root('data', '2014', "#{profile[:github]}.yaml"), erb.result(binding))
  end

end
