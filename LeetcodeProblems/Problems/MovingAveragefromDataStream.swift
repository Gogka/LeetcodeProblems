//
//  MovingAveragefromDataStream.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation
struct MovingAveragefromDataStream {
    /// ✅ https://leetcode.com/problems/moving-average-from-data-stream/description/
    class MovingAverage {
        private var queue: DictionaryQueue<Int>
        private let size: Int
        private var currentSize: Int = 0
        private var currentSum: Int = 0
        init(_ size: Int) {
            self.size = size
            queue = .init(size: size)
        }
        func next(_ val: Int) -> Double {
            if currentSize == size {
                currentSum -= queue.dequeue()!
            } else {
                currentSize += 1
            }
            _ = queue.enqueue(val)
            currentSum += val
            return Double(currentSum) / Double(currentSize)
        }
    }
}
