# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# typed: strict

require "sorbet-runtime"

#
#
class Day03
    extend T::Sig

    #
    #
    sig { params(path: String, debug: T::Boolean).returns(String) }
    def self.part01(path, debug)
        data = ""

        File.open(path, "r") do |file|
            file.each_line do |line|
                numbers = line.split(/\s+/)

                numbers.each_with_index do |n, i|
                    data += (i % 2 == 0 ? "." : "#") * n.to_i
                end
            end
        end

        data
    end
end
