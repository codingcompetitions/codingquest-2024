# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

require "test_helper"

class Day05Test < ActiveSupport::TestCase
    test "Day05 Sample" do
        path = "../codingquest-data/2024/sample/day05-01.in"

        skip unless File.exist? path

        assert_equal 353_480, Day05.part01(path, false)
    end

    test "Day05 Input" do
        path = "../codingquest-data/2024/input/day05-01.in"

        skip unless File.exist? path

        assert_equal 6_979_629, Day05.part01(path, false)
    end
end
