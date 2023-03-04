//
//  FirstBadVersion.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 02.03.2023.
//

import Foundation

struct FirstBadVersion {
    func isBadVersion(_ version: Int) -> Bool { true }
    /// ✅ https://leetcode.com/problems/first-bad-version/description/
    func firstBadVersion(_ n: Int) -> Int {
        var left: Int = 1
        var right: Int = n
        while left < right {
            let mid: Int = (left + right) / 2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
