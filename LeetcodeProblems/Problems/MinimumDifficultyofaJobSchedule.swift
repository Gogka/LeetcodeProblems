//
//  MinimumDifficultyofaJobSchedule.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 20.03.2023.
//

import Foundation

final class MinimumDifficultyofaJobSchedule {
    /// ✅ https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/description/
    /// Bottom up
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        if jobDifficulty.count < d { return -1 }
        var dp: [[Int]] = .init(repeating: .init(repeating: .max, count: d), count: jobDifficulty.count)
        dp[jobDifficulty.count - 1][d - 1] = jobDifficulty.last!
        for i in (0..<jobDifficulty.count - 1).reversed() {
            dp[i][d - 1] = max(jobDifficulty[i], dp[i + 1][d - 1])
        }
        for curDay in (0..<d - 1).reversed() {
            for job in (curDay...jobDifficulty.count - (d - curDay)).reversed() {
                var hardest: Int = .min
                for j in job...jobDifficulty.count - (d - curDay) {
                    hardest = max(jobDifficulty[j], hardest)
                    dp[job][curDay] = min(hardest + dp[j + 1][curDay + 1], dp[job][curDay])
                }
            }
        }
        return dp[0][0]
    }
    /// Top down
    var memo: [[Int]] = [[]]
//    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
//        memo = .init(repeating: .init(repeating: -1, count: d), count: jobDifficulty.count)
//        if jobDifficulty.count < d { return -1 }
//        return minDifficulty(jobIndex: 0, curDay: 1, jobDifficulty, d)
//    }
    func minDifficulty(jobIndex: Int, curDay: Int, _ jobDifficulty: [Int], _ d: Int) -> Int {
        if memo[jobIndex][curDay - 1] != -1 {
            return memo[jobIndex][curDay - 1]
        }
        if curDay == d {
            var maxR: Int = .min
            for i in jobIndex..<jobDifficulty.count {
                maxR = max(maxR, jobDifficulty[i])
            }
            return maxR
        }
        let jobsToTake: Int = jobDifficulty.count - (d - curDay)
        var hardest: Int = .min
        var result: Int = .max
        for i in jobIndex..<jobsToTake {
            hardest = max(jobDifficulty[i], hardest)
            result = min(result, hardest + minDifficulty(jobIndex: i + 1, curDay: curDay + 1, jobDifficulty, d))
        }
        memo[jobIndex][curDay - 1] = result
        return result
    }
    // MARK: -
    struct TestCase {
        let jobDifficulty: [Int]
        let d: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(jobDifficulty: [11,111,22,222,33,333,44,444], d: 6, result: 843),
            .init(jobDifficulty: [7,1,7,1,7,1], d: 3, result: 15),
            .init(jobDifficulty: [6,5,4,3,2,1], d: 2, result: 7),
            .init(jobDifficulty: [6,5,4,3,2,1], d: 3, result: 9),
            .init(jobDifficulty: [9,9,9], d: 4, result: -1),
            .init(jobDifficulty: [1,1,1], d: 3, result: 3)
        ]
        for (i, tCase) in cases.enumerated() {
            if minDifficulty(tCase.jobDifficulty, tCase.d) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
