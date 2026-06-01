class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1

        while left < right {
            let leftNumber = numbers[left]
            let rightNumber = numbers[right]
            let sum = leftNumber + rightNumber

            if sum < target {
                left += 1
            } else if sum > target {
                right -= 1
            } else {
                return [left + 1, right + 1]
            }
        }

        return []
    }
}
