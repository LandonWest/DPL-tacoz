desc 'This is crap. Rake the leaves'
task leaves: :environment do  #name of the rake task: :environment, this will always run rake task in current environment
  puts "raking the leaves"
end

namespace :garden do

  desc 'Show our tools'
  task tools: :environment do
    puts ['rake', 'hoe', 'leaf blower']
  end

  desc 'Use a tool'
  task using: :environment do
    tool = ENV['TOOL'] || 'hose'
    puts "Using the #{tool}"
  end

end