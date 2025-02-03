# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

class Day02
    ##
    #       45 00 03 77 00 00 00 00 83 06 f3 9f 0A 00 0b c1 d7 25 34 41
    # byte   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
    # index  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19
    def self.part01(path, debug)
        system_length = 0
        passenger_length = 0

        File.open(path, "r") do |file|
            file.each_line do |line|
                packet = line.scan(/../)

                length = (packet[2] + packet[3]).hex
                source = [ packet[12].hex, packet[13].hex, packet[14].hex, packet[15].hex ]
                dest = [ packet[16].hex, packet[17].hex, packet[18].hex, packet[19].hex ]

                if debug
                    puts "#{line.strip} - Length #{length} bytes, source IP address #{source.join "."}, destination #{dest.join "."}"
                end

                if [ source[0], dest[0] ].include?(192) && [ source[1], dest[1] ].include?(168)
                    system_length += length
                else
                    passenger_length += length
                end
            end
        end

        "#{system_length}/#{passenger_length}"
    end
end
