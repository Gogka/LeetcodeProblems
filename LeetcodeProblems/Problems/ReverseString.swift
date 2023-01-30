//
//  ReverseString.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct ReverseString {
    /// ✅ https://leetcode.com/problems/reverse-string/description/
    func reverseString(_ s: inout [Character]) {
        guard s.count > 1 else { return }
        var i: Int = 0
        while i <= s.count - 1 - i {
            let tem: Character = s[i]
            s[i] = s[s.count - 1 - i]
            s[s.count - 1 - i] = tem
            i += 1
        }
    }
    private final class Example {
        var s: [Character]
        let res: [Character]
        init(s: [Character], res: [Character]) {
            self.s = s
            self.res = res
        }
    }
    func test() {
        let examples: [Example] = [
            .init(s: ["h","e","l","l","o"], res: ["o","l","l","e","h"]),
            .init(s: ["H","a","n","n","a","h"], res: ["h","a","n","n","a","H"]),
        ]
        for (i, ex) in examples.enumerated() {
            reverseString(&ex.s)
            if ex.s != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
