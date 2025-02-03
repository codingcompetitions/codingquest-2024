# (c) Manuel Alejandro Gómez Nicasio <az-dev@outlook.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

require "test_helper"

class Day01Test < ActiveSupport::TestCase
    test "Day01" do
        assert_equal 191_274, Day01.part01("../codingquest-data/2024/day01-01.in", false)
    end
end
