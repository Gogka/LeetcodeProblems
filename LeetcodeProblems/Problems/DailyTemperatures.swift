//
//  DailyTemperatures.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation
struct DailyTemperatures {
    /// ✅ https://leetcode.com/problems/daily-temperatures/description/
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answers: [Int] = .init(repeating: 0, count: temperatures.count)
        var maxTemperatures: [(index: Int, temp: Int)] = []
        for i in (0..<temperatures.count).reversed() {
            let temp: Int = temperatures[i]
            while !maxTemperatures.isEmpty {
                if maxTemperatures.last!.temp > temp {
                    answers[i] = maxTemperatures.last!.index - i
                    maxTemperatures.append((i, temp))
                    break
                } else {
                    maxTemperatures.removeLast()
                }
            }
            if maxTemperatures.isEmpty {
                maxTemperatures.append((i, temp))
            }
        }
        return answers
    }
    struct Case {
        let temperatures: [Int]
        let result: [Int]
    }
    func test() {
        let cases: [Case] = [
            .init(temperatures: [73,74,75,71,69,72,76,73], result: [1,1,4,2,1,1,0,0]),
            .init(temperatures: [30,40,50,60], result: [1,1,1,0]),
            .init(temperatures: [30,60,90], result: [1,1,0]),
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if dailyTemperatures(c.temperatures) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
