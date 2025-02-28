# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

require "test_helper"

class Day01Test < ActiveSupport::TestCase
    test "Day01 Sample" do
        path = "../codingquest-data/2024/sample/day01-01.in"

        skip unless File.exist? path

        assert_equal 2533, Day01.part01(path, false)
    end

    test "Day01 Input" do
        path = "../codingquest-data/2024/input/day01-01.in"

        skip unless File.exist? path

        assert_equal 191_274, Day01.part01(path, false)
    end
end
