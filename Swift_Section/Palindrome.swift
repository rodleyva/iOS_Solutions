import Foundation
// MARK: Palindrome (Optional)

//1: no recursion

func isPalindrome1(word: String)->Bool{
    
    let stringLength = word.count
    var position = 0
    
    while position < stringLength / 2 {
        let startIndex = word.index(word.startIndex, offsetBy: position)
        let endIndex = word.index(word.endIndex, offsetBy: -position - 1)
        
        if word[startIndex] == word[endIndex] {
            position += 1
        } else {
            return false
        }
    }
    
    return true
}

isPalindrome1(word: "codingdojo")

// 2: with recursion

func isPalindrome2(word: String) -> Bool{
    guard word.count >= 2 else {
        return true
    }
    
    let end = word.index(word.endIndex, offsetBy: -1)
    
    if word[word.startIndex] == word[end]{
        let start = word.index(word.startIndex, offsetBy: 1)
        return isPalindrome2(word: String(word[start..<end]))
    }else {
        return false
    }
}

//3: least amount of code
func isPalindrome3(word: String)->Bool{
    return word == String(word.reversed())
}
