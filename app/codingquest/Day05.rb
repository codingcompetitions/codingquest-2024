# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# typed: strict

require "sorbet-runtime"

#
#
class Day05
    extend T::Sig

    #
    #
    sig { params(path: String, debug: T::Boolean).returns(Integer) }
    def self.part01(path, debug)
        distances = {}
        routes = []
        rovers = []

        File.open(path, "r") do |file|
            destinations = file.gets.split.map(&:to_sym)

            file.each_line do |line|
                break if line.strip == ""

                chunks = line.split

                distances[chunks[0].to_sym] = {}

                chunks.drop(1).each_with_index do |element, index|
                    distances[chunks[0].to_sym][destinations[index]] = element.to_i
                end
            end

            file.each_line do |line|
                routes.push line.split(/:|->/).drop(1).map(&:strip).map(&:to_sym)
            end
        end

        routes.each do |route|
            distance = 0
            prev = route[0]

            route.drop(1).each do |element|
                distance += distances[prev][element]

                prev = element
            end

            rovers.push distance
        end

        rovers.sum
    end
end
