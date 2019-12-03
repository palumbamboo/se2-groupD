require 'scripts/default_data'
require 'awesome_print'

namespace :seed do
  task default_data: :environment do
    helper = DefaultData.new
    puts "==== Start seeding ===="
    puts "Clean db: #{helper.clean_db}"
    puts "Seed db: "
    ap helper.seed, index: false, indent: -2, ruby19_syntax: true
    puts "==== Finish seeding ===="
  end

end
