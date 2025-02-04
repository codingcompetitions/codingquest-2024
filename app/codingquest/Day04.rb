# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

class Day04
    def self.part01(path, debug)
        data = []
        distances = []

        File.open(path, "r") do |file|
            file.gets

            file.each_line do |line|
                chunks = line.strip.split(/\s{2,}/)

                data.push({ system: chunks[0], x: chunks[2].to_f, y: chunks[3].to_f, z: chunks[4].to_f })
            end
        end

        data.each do |d|
            data.each do |element|
                next if d[:system] == element[:system]

                distance = ((d[:x] - element[:x]) ** 2 + (d[:y] - element[:y]) ** 2 + (d[:z] - element[:z]) ** 2) ** 0.5

                distances.push({ from: d[:system], to: element[:system], distance: distance.round(3) })
            end
        end

        distances.sort_by! { |element| element[:distance] }

        distances.first[:distance]
    end
end
