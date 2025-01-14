namespace :day01 do
  task :part01, [:path, :debug] => :environment do |task, args|
    debug = args.key?(:debug) && args[:debug].downcase == "true"

    unless args.key?(:path) && File.exist?(args[:path])
      STDERR.puts "File NOT found"
    end

    puts Day01.part01(args[:path], debug)
  end
end
