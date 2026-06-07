class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        triplets = []
        nums.sort()
        for i in range(len(nums)):
            #should be always 0 or nagative number
            if nums[i] > 0:
                break
            #Avoid duplications    
            if i > 0 and nums[i] == nums[i - 1]:
                continue
            # Target: b + c = -a    
            pairs = self.sortedPairs(nums, i + 1, -nums[i])
            for pair in pairs:
                triplets.append([nums[i]] + pair)
        return triplets

    def sortedPairs(self, nums: List[int], startIndex: int, target: int) -> List[List[int]]:
        pairs = []
        left = startIndex
        right = len(nums) - 1

        while left < right:
            sum = nums[left] + nums[right]
            if sum == target:
                pairs.append([nums[left], nums[right]])
                left += 1
                while left < right and nums[left] == nums[left - 1]:
                    left += 1
            elif sum < target:
                left += 1
            else:
                right -= 1     
        return pairs       
        
