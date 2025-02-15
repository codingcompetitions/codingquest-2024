# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

# typed: strict

require "sorbet-runtime"

#
#
class Day06
    extend T::Sig

    #
    #
    # @param path [String] Path to file.
    # @param debug [true, false] if _debug_ is enabled.
    # @return [String] The message decoded.
    sig { params(path: String, debug: T::Boolean).returns(String) }
    def self.part01(path, debug)
        alphabet = [
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
        ]

        key = T.let([""], T::Array[String])
        message = T.let([""], T::Array[String])
        playfair = nil

        decoded_message = []

        File.open(path, "r") do |file|
            file.gets

            key = T.must(file.gets).split(/:/).reverse.fetch(0).strip.split(//).uniq

            file.gets

            message = T.must(file.gets).split(/:/).reverse.fetch(0).strip.split(/\s/)
        end

        playfair = (key + (alphabet - key)).each_slice(5).to_a

        message.each do |word|
            word.scan(/../).each do |chunk|
                decoded_message << decode(chunk.split(""), playfair, debug)
            end

            decoded_message << " "
        end

        decoded_message.join("").strip
    end

    private

    #
    #
    #
    sig { params(chunk: T::Array[String], playfair: T::Array[T::Array[String]], debug: T::Boolean).returns(String) }
    def self.decode(chunk, playfair, debug)
        index_first = T.let(nil, T.nilable(Integer))
        row_first = T.let(nil, T.nilable(Integer))

        index_last = T.let(nil, T.nilable(Integer))
        row_last = T.let(nil, T.nilable(Integer))

        playfair.transpose.each do |line|
            if line.include? chunk.fetch(0) and line.include? chunk.reverse.fetch(0)
                index_first = T.must(line.index(chunk.fetch(0))) - 1
                index_first = line.length - 1 if index_first < 0

                index_last = T.must(line.index(chunk.reverse.fetch(0))) - 1
                index_last = line.length - 1 if index_last < 0

                return "#{line[index_first]}#{line[index_last]}"
            end
        end

        playfair.each_with_index do |line, index|
            if line.include? chunk.fetch(0) and line.include? chunk.reverse.fetch(0)
                index_first = T.must(line.index(chunk.fetch(0))) - 1
                index_first = line.length - 1 if index_first < 0

                index_last = T.must(line.index(chunk.reverse.fetch(0))) - 1
                index_last = line.length - 1 if index_last < 0

                return "#{line[index_first]}#{line[index_last]}"
            else
                if line.include? chunk.fetch(0) and index_first.nil?
                    row_first = index
                    index_first = line.index chunk.fetch(0)
                elsif line.include? chunk.reverse.fetch(0) and index_last.nil?
                    row_last = index
                    index_last = line.index chunk.reverse.fetch(0)
                end

                unless row_first.nil? or row_last.nil?
                    puts "#{line} => #{index}\n\t#{chunk} #{row_first} - #{index_first} ~ #{row_last} - #{index_last}" if debug

                    return "#{T.must(playfair[row_first])[T.must(index_last)]}#{T.must(playfair[row_last])[T.must(index_first)]}"
                end
            end
        end

        "**"
    end
end
