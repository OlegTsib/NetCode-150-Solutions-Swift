class Solution:
    def twoSum(self, numbers: List[int], target: int) -> List[int]:
        left = 0
        right = len(numbers) - 1

        while left < right:
            leftNumber = numbers[left]
            rightNumber = numbers[right]
            sum = leftNumber + rightNumber

            if sum < target:
                left += 1
            elif sum > target:
                right -= 1
            else:
                return [left + 1, right + 1] 

        return []
