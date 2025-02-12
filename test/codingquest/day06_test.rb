# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

require "test_helper"

class Day06Test < ActiveSupport::TestCase
    test "Day06 Sample" do
        path = "../codingquest-data/2024/sample/day06-01.in"

        skip unless File.exist? path

        assert_equal "et phonex home", Day06.part01(path, false)
    end

    test "Day06 Input" do
        path = "../codingquest-data/2024/input/day06-01.in"

        skip unless File.exist? path

        assert_equal "please pick up some milk on thex wayx home", Day06.part01(path, false)
    end
end
