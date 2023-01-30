//
//  OpentheLock.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.01.2023.
//

import Foundation

struct OpentheLock {
    /// ✅ https://leetcode.com/problems/open-the-lock/description/
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let length: Int = 4
        let start: String = .init(repeating: "0", count: length)
        if target == start { return 0 }
        var level: Int = 1
        var allDeadends: Set<String> = .init(deadends)
        if allDeadends.contains(start) { return -1 }
        allDeadends.insert(start)
        var currentOptions: [String] = [start]
        var newOptions: [String] = []
        var previousLevelCount: Int = 1
        while previousLevelCount > 0 {
            let currentOption: String = currentOptions.removeLast()
            for i in 0..<length {
                let upDigitCode: String = next(currentOption, i: i, isUp: true)
                if upDigitCode == target { return level }
                let downDigitCode: String = next(currentOption, i: i, isUp: false)
                if downDigitCode == target { return level }
                if !allDeadends.contains(upDigitCode) {
                    allDeadends.insert(upDigitCode)
                    newOptions.append(upDigitCode)
                }
                if !allDeadends.contains(downDigitCode) {
                    allDeadends.insert(downDigitCode)
                    newOptions.append(downDigitCode)
                }
            }
            previousLevelCount -= 1
            if previousLevelCount <= 0 {
                level += 1
                currentOptions = newOptions
                previousLevelCount = newOptions.count
                newOptions = []
            }
        }
        return -1
    }
    private struct Example {
        let deadends: [String]
        let target: String
        let result: Int
    }
    func test() {
        let examples: [Example] = [
            .init(deadends: ["0201","0101","0102","1212","2002"], target: "0202", result: 6),
            .init(deadends: ["8888"], target: "0009", result: 1),
            .init(deadends: ["8887","8889","8878","8898","8788","8988","7888","9888"], target: "8888", result: -1)
        ]
        for (i, ex) in examples.enumerated() {
            if openLock(ex.deadends, ex.target) != ex.result {
                print("Error in \(i + 1) example.")
                return
            }
        }
    }
    private func next(_ code: String, i: Int, isUp: Bool) -> String {
        let index: String.Index = code.index(code.startIndex, offsetBy: i)
        var dig: Int = Int(String(code[index]))!
        if isUp {
            if dig == 9 {
                dig = 0
            } else {
                dig += 1
            }
        } else {
            if dig == 0 {
                dig = 9
            } else {
                dig -= 1
            }
        }
        return code.replacingCharacters(in: (index...index), with: "\(dig)")
    }
}
