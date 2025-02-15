# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# typed: strict

require "sorbet-runtime"

#
#
class Day01
    extend T::Sig

    #
    #
    sig { params(path: String, debug: T::Boolean).returns(Integer) }
    def self.part01(path, debug)
        spaceliner = {}
        prices = []

        File.open(path, "r") do |file|
            file.each_line do |line|
                chunks = line.downcase.split(/[:\s]+/)
                chunks[2] = chunks[2].to_i

                chunks[2] = chunks.fetch(2) * -1 if %w[discount rebate].include?(chunks[1])

                spaceliner[chunks[0]] ||= {}
                spaceliner[chunks[0]][chunks[1]] ||= 0
                spaceliner[chunks[0]][chunks[1]] += chunks[2]
            end
        end

        spaceliner.each do |key, value|
            prices.push({ spaceliner: key, price: value.values.sum })
        end

        prices.sort_by! { |element| element[:price] }

        prices.fetch(0)[:price]
    end
end
