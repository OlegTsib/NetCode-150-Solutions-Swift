class Solution {
    // Notes
    // "a" will always be negative -a
    // b + c = -a
    // c = -(a + b)
    // "c" will always be unique because a pair of unique [a, b] will result in a unique "c" value
    """
    Time complexity: O(n2)
    Space complexity: O(n)
    
    n is the number of elements in the input array nums.
    The outer forEach iterates n times, and for each iteration, pairSumSorted runs in O(n) with its two-pointer approach, resulting in O(n^2).
    The space complexity is O(n) for the sorted array and the tripples output storage.
    """
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var tripples = [[Int]]()
        let sorted = nums.sorted()
        sorted.enumerated().forEach { index, value in
            guard value <= 0 else { return }

            if index > 0, index + 1 < sorted.count, value == sorted[index - 1] {
                return
            }

            let pairs = pairSumSorted(nums: sorted, startIndex: index + 1, target: -value) 
            tripples += pairs.map { [value] + $0 }
        }

        return tripples
    }

    func pairSumSorted(nums: [Int], startIndex: Int, target: Int) -> [[Int]] {
        var leftIndex = startIndex
        var rightIndex = nums.count - 1
        var pairs = [[Int]]()

        while leftIndex < rightIndex {
            let sum = nums[leftIndex] + nums[rightIndex]

            if sum == target {
                pairs.append([nums[leftIndex], nums[rightIndex]])
                leftIndex += 1
                // To avoid duplicate [b, c] pairs, skip "b"
                while leftIndex < rightIndex && (nums[leftIndex] == nums[leftIndex - 1]) {
                    leftIndex += 1
                }
            } else if sum < target {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
        }

        return pairs
    }
}
