//
//  TheKWeakestRowsinaMatrix.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 14.01.2023.
//

import Foundation

struct TheKWeakestRowsinaMatrix {
    /// ✅ https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/description/
    struct Row: Comparable {
        let i: Int
        let soldiers: Int
        static func < (lhs: TheKWeakestRowsinaMatrix.Row, rhs: TheKWeakestRowsinaMatrix.Row) -> Bool {
            lhs.soldiers < rhs.soldiers || (lhs.soldiers == rhs.soldiers && lhs.i < rhs.i)
        }
    }
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var soldiers: Int = 0
        var heap: Heap<Row> = .maxHeap()
        for i in 0..<mat.count {
            soldiers = 0
            for j in 0..<mat[i].count {
                if mat[i][j] == 0 { break }
                soldiers += mat[i][j]
            }
            heap.add(.init(i: i, soldiers: soldiers))
            if heap.count > k {
                heap.poll()
            }
        }
        var result: [Int] = .init(repeating: 0, count: heap.count)
        var i: Int = heap.count - 1
        while i >= 0 {
            result[i] = heap.poll()!.i
            i -= 1
        }
        return result
    }
    private struct Example {
        let mat: [[Int]]
        let k: Int
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(mat: [[1,1,0,0,0],
                        [1,1,1,1,0],
                        [1,0,0,0,0],
                        [1,1,0,0,0],
                        [1,1,1,1,1]],
                  k: 3,
                  res: [2,0,3]),
            .init(mat: [[1,0,0,0],
                        [1,1,1,1],
                        [1,0,0,0],
                        [1,0,0,0]],
                  k: 2,
                  res: [0,2])
        ]
        for (i, ex) in examples.enumerated() {
            if kWeakestRows(ex.mat, ex.k) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
