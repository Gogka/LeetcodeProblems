//
//  FindSmallestLetterGreaterThanTarget.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.03.2023.
//

import Foundation

struct FindSmallestLetterGreaterThanTarget {
    /// ✅ https://leetcode.com/problems/find-smallest-letter-greater-than-target/description/
//    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
//        var left: Int = 0
//        var right: Int = letters.count - 1
//        while left < right {
//            let mid: Int = (left + right) / 2
//            if letters[mid] == target || letters[mid] < target {
//                left = mid + 1
//            } else {
//                right = mid
//            }
//        }
//        if left - 1 < 0 {
//            return letters[0]
//        } else if (letters[left - 1] == target || letters[left - 1] != letters[left]) && letters[left] > target {
//            return letters[left]
//        } else {
//            return letters[0]
//        }
//    }
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var left: Int = 0
        var right: Int = letters.count - 1
        while left <= right {
            let mid: Int = (left + right) / 2
            if letters[mid] <= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left == letters.count ? letters.first! : letters[left]
    }
    struct TestCase {
        let letters: [Character]
        let target: Character
        let result: Character
    }
    func test() {
        let cases: [TestCase] = [
            .init(letters: ["c","f","j"], target: "a", result: "c"),
            .init(letters: ["c","f","j"], target: "c", result: "f"),
            .init(letters: ["x","x","y","y"], target: "z", result: "x"),
            .init(letters: ["a", "b", "x","x","y","y"], target: "x", result: "y"),
            .init(letters: ["c","f","j"], target: "g", result: "j"),
            .init(letters: ["c","f","j"], target: "k", result: "c")
        ]
        for (i, tcase) in cases.enumerated() {
            if nextGreatestLetter(tcase.letters, tcase.target) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
