//
//  Sort.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 09.01.2023.
//

import Foundation

extension Array {
    mutating func selectionSort(_ compare: (Element, Element) -> Bool) {
        if isEmpty { return }
        for i in 0..<count {
            var index: Int = i
            for j in i..<count {
                if compare(self[j], self[index]) {
                    index = j
                }
            }
            swapAt(i, index)
        }
    }
    mutating func bubbleSort(_ compare: (Element, Element) -> Bool) {
        while true {
            var swapPerformed: Bool = false
            for i in 1..<count {
                if compare(self[i], self[i - 1]) {
                    swapAt(i, i - 1)
                    swapPerformed = true
                }
            }
            if !swapPerformed { return }
        }
    }
    mutating func insertionSort(_ compare: (Element, Element) -> Bool) {
        for i in 1..<count {
            var j: Int = i - 1
            if !compare(self[i], self[j]) { continue }
            var _i: Int = i
            while j >= 0, compare(self[_i], self[j]) {
                swapAt(_i, j)
                j -= 1
                _i -= 1
            }
        }
    }
}
