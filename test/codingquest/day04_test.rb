# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

require "test_helper"

class Day04Test < ActiveSupport::TestCase
    test "Day04 Sample" do
        path = "../codingquest-data/2024/sample/day04-01.in"

        skip unless File.exist? path

        assert_equal 3.508, Day04.part01(path, false)
    end

    test "Day04 Input" do
        path = "../codingquest-data/2024/input/day04-01.in"

        skip unless File.exist? path

        assert_equal 1.099, Day04.part01(path, false)
    end
end
