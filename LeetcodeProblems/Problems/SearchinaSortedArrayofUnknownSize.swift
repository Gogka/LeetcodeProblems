//
//  SearchinaSortedArrayofUnknownSize.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.03.2023.
//

import Foundation

struct SearchinaSortedArrayofUnknownSize {
    final class ArrayReader: ExpressibleByArrayLiteral {
        typealias ArrayLiteralElement = Int
        private let arr: [ArrayLiteralElement]
        init(arrayLiteral elements: ArrayLiteralElement...) {
            arr = elements
        }
        func get(_ index: Int) -> Int {
            if index < 0 || index >= arr.count { return Int.max }
            return arr[index]
        }
    }
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        var left: Int = 0
        var count: Int = 1
        while true {
            if left == count { return -1 }
            let mid: Int = (left + count) / 2
            switch reader.get(mid) {
            case .max:
                count = (left + mid) / 2
            case (let value):
                if value == target {
                    return mid
                } else if value > target {
                    if mid - 1 == left { return -1 }
                    count = mid
                } else {
                    left = mid
                    count = count * 2
                }
            }
        }
    }
    struct TestCase {
        let reader: ArrayReader
        let target: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(reader: [0], target: 0, result: 0),
            .init(reader: [0], target: 1, result: -1),
            .init(reader: [0,2], target: 1, result: -1),
            .init(reader: [-1,0,3,5,9,12], target: 9, result: 4),
            .init(reader: [-1,0,3,5,9,12], target: 2, result: -1),
            .init(reader: [-1,0,3,5,9,12], target: 13, result: -1),
            .init(reader: [-1,0,3,5,9,12], target: 12, result: 5)
        ]
        for (i, tcase) in cases.enumerated() {
            if search(tcase.reader, tcase.target) != tcase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
