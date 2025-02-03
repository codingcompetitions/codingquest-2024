# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

require "test_helper"

class Day02Test < ActiveSupport::TestCase
    test "Day02 Sample" do
        path = "../codingquest-data/2024/sample/day02-01.in"

        skip unless File.exist? path

        assert_equal "868/1625", Day02.part01(path, false)
    end

    test "Day02 Input" do
        path = "../codingquest-data/2024/input/day02-01.in"

        skip unless File.exist? path

        assert_equal "258956/256237", Day02.part01(path, false)
    end
end
