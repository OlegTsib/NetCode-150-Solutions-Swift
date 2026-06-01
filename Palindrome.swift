class Solution {
    """
    Time complexity: O(n)
    Space complexity: O(1)
    """
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty && s.count != 1 else { return true }

        var leftIndex = s.startIndex
        var rightIndex = s.index(before: s.endIndex)

        while leftIndex < rightIndex {
            let leftChar = s[leftIndex]
            let rightChar = s[rightIndex]

            if !isAlphanumeric(leftChar) {
                leftIndex = s.index(after: leftIndex)
            } else if !isAlphanumeric(rightChar) {
                rightIndex = s.index(before: rightIndex)
            } else if leftChar.lowercased() == rightChar.lowercased() {
                leftIndex = s.index(after: leftIndex)
                rightIndex = s.index(before: rightIndex)
            } else {
                return false
            }
        }

        return true
    }

    // Space complexity: O(n) becouse was created a new Array 'let text = Array(s.lowercased())' 
    // Just an example without String.Index
"""
    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty || s.count == 1  else { return true }
        let text = Array(s.lowercased())
        var leftIndex = 0
        var rightIndex = text.count - 1

        while leftIndex < rightIndex {
            let leftValue = text[leftIndex]
            let rightValue = text[rightIndex]

            if !isAlphanumeric(leftValue) {
                leftIndex += 1
            } else if !isAlphanumeric(rightValue) {
                rightIndex -= 1
            } else if leftValue == rightValue {
                leftIndex += 1
                rightIndex -= 1
            } else {
                return false
            }
        }

        return true
    }
"""
    func isAlphanumeric(_ char: Character) -> Bool {
        char.isLetter || char.isNumber
    }
}
