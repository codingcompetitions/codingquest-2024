# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

namespace :day05 do
  task :part01, [ :path, :debug ] => :environment do |task, args|
    debug = args.key?(:debug) && args[:debug].downcase == "true"

    unless args.key?(:path) && File.exist?(args[:path])
      STDERR.puts "File NOT found"
    end

    puts Day05.part01(args[:path], debug)
  end
end
