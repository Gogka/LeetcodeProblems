//
//  FindMedianfromDataStream.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 04.02.2023.
//

import Foundation

struct FindMedianfromDataStream {
    /// ✅ https://leetcode.com/problems/find-median-from-data-stream/description/
    class MedianFinder {
        private var left: Heap<Int> = .maxHeap()
        private var right: Heap<Int> = .minHeap()
        init() {
            
        }
        func addNum(_ num: Int) {
            if left.isEmpty {
                left.add(num)
            } else if left.peek()! >= num {
                left.add(num)
            } else {
                right.add(num)
            }
            while abs(left.count - right.count) > 1 {
                if left.count > right.count {
                    right.add(left.poll()!)
                } else {
                    left.add(right.poll()!)
                }
            }
        }
        func findMedian() -> Double {
            if left.count > right.count { return Double(left.peek()!) }
            if right.count > left.count { return Double(right.peek()!) }
            return Double(right.peek()! + left.peek()!) / 2
        }
    }
    struct Case {
        let nums: [[Int]]
        let result: [[Double]]
    }
    func test() {
        let cases: [Case] = [
//            .init(nums: [[12],[],[10],[],[13],[],[11],[],[5],[],[15],[],[1],[],[11],[],[6],[],[17],[],[14],[],[8],[],[17],[],[6],[],[4],[],[16],[],[8],[],[10],[],[2],[],[12],[],[0]],
//                  result: [[12],[],[11],[],[12],[],[11.5],[],[11],[],[11.5],[],[11],[],[11],[],[11],[],[11],[],[11],[],[11],[],[11],[],[11],[],[11],[],[11],[],[11],[],[10.5],[],[10],[],[10.5],[],[10]]),
//            .init(nums: [[1],[],[2],[],[3],[],[4],[],[5],[],[6],[],[7],[],[8],[],[9],[],[10]],
//                  result: [[1],[],[1.5],[],[2],[],[2.5],[],[3],[],[3.5],[],[4],[],[4.5],[],[5],[],[5.5]]),
//            .init(nums: [[6],[],[10],[],[2],[],[6],[],[5],[],[0],[],[6],[],[3],[],[1],[],[0],[],[0]],
//                  result: [[6],[],[8],[],[6],[],[6],[],[6],[],[5.5],[],[6],[],[5.5],[],[5],[],[4],[],[3]]),
            .init(nums:
                  [[],[40],[],[12],[],[16],[],[14],[],[35],[],[19],[],[34],[],[35],[],[28],[],[35],[],[26],[],[6],[],[8],[],[2],[],[14],[],[25],[],[25],[],[4],[],[33],[],[18],[],[10],[],[14],[],[27],[],[3],[],[35],[],[13],[],[24],[],[27],[],[14],[],[5],[],[0],[],[38],[],[19],[],[25],[],[11],[],[14],[],[31],[],[30],[],[11],[],[31],[],[0]],
                  result: [[],[40.00000],[],[26.00000],[],[16.00000],[],[15.00000],[],[16.00000],[],[17.50000],[],[19.00000],[],[26.50000],[],[28.00000],[],[31.00000],[],[28.00000],[],[27.00000],[],[26.00000],[],[22.50000],[],[19.00000],[],[22.00000],[],[25.00000],[],[22.00000],[],[25.00000],[],[22.00000],[],[19.00000],[],[18.50000],[],[19.00000],[],[18.50000],[],[19.00000],[],[18.50000],[],[19.00000],[],[21.50000],[],[19.00000],[],[18.50000],[],[18.00000],[],[18.50000],[],[19.00000],[],[19.00000],[],[19.00000],[],[18.50000],[],[19.00000],[],[19.00000],[],[19.00000],[],[19.00000],[],[19.00000]])
        ]
        for (i, c) in cases.enumerated() {
            let median: MedianFinder = .init()
            var res: [[Double]] = []
            for num in c.nums {
                if num.isEmpty {
                    res.append([])
                    continue
                }
                median.addNum(num.first!)
                print(median.findMedian())
                res.append([median.findMedian()])
            }
            if res != c.result {
                print("Error in \(i).\nAnswer: \(res)).\nExpected: \(c.result)")
                break
            }
        }
    }
}
