//
//  KClosestPointstoOrigin.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 31.01.2023.
//

import Foundation

struct KClosestPointstoOrigin {
    /// ✅ https://leetcode.com/problems/k-closest-points-to-origin/description/
    struct PointData: Comparable {
        static func < (lhs: PointData, rhs: PointData) -> Bool {
            lhs.distance < rhs.distance
        }
        let distance: Int
        let index: Int
    }
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap: Heap<PointData> = .maxHeap()
        for i in 0..<points.count {
            let point: [Int] = points[i]
            heap.add(.init(distance: point.first! * point.first! + point.last! * point.last!, index: i))
            if heap.count > k {
                heap.poll()
            }
        }
        var result: [[Int]] = []
        result.reserveCapacity(k)
        while !heap.isEmpty {
            result.append(points[heap.poll()!.index])
        }
        return result
    }
    private struct Example {
        let points: [[Int]]
        let k: Int
        let res: [[Int]]
    }
    func test() {
        let examples: [Example] = [
            .init(points: [[1,3], [-2,2]], k: 1, res: [[-2,2]]),
            .init(points: [[3,3],[5,-1],[-2,4]], k: 2, res: [[3,3],[-2,4]]),
        ]
        for (i, ex) in examples.enumerated() {
            if kClosest(ex.points, ex.k) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
