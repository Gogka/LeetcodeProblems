//
//  ImplementstrStr.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 07.01.2023.
//

import Foundation
struct ImplementstrStr {
    /// ✅ https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystackChars: [Character] = .init(haystack)
        for i in 0..<haystackChars.count {
            var isPassed: Bool = true
            var iCounter: Int = i
            for needleChar in needle {
                if haystackChars.count <= iCounter || needleChar != haystackChars[iCounter] {
                    isPassed = false
                    break
                }
                iCounter += 1
            }
            if isPassed { return i }
        }
        return -1
    }
    private struct Example {
        let haystack: String
        let needle: String
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(haystack: "11", needle: "1", res: 0),
            .init(haystack: "sadbutsad", needle: "sad", res: 0),
            .init(haystack: "leetcode", needle: "leeto", res: -1),
        ]
        for (i, ex) in examples.enumerated() {
            if strStr(ex.haystack, ex.needle) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
