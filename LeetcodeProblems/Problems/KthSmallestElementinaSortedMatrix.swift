//
//  KthSmallestElementinaSortedMatrix.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 14.01.2023.
//

import Foundation

struct KthSmallestElementinaSortedMatrix {
    struct Element: Comparable {
        let val: Int
        let row: Int
        let column: Int
        static func < (lhs: Element, rhs: Element) -> Bool {
            lhs.val < rhs.val
        }
    }
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var heap: Heap<Element> = .minHeap()
        let count: Int = min(matrix.count, k)
        for i in 0..<count {
            heap.add(.init(val: matrix[i][0], row: i, column: 0))
        }
        var counter: Int = 1
        while counter < k {
            var top: Element = heap.poll()!
            while top.column + 1 >= matrix[0].count && counter < k {
                counter += 1
                if counter == k { break }
                top = heap.poll()!
            }
            if counter == k { break }
            counter += 1
            heap.add(.init(val: matrix[top.row][top.column + 1], row: top.row, column: top.column + 1))
        }
        return heap.peek()!.val
    }
//    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
//        var indexes: [Int] = .init(repeating: 0, count: matrix.count)
//        func getIndexesIndex(_ row: Int) -> Int {
//            matrix.count - 1 - row
//        }
//        var tmpK: Int = 0
//        while true {
//            var row: Int = matrix.count - indexes.count
//            let column: Int = indexes[getIndexesIndex(row)]
//            if matrix[row].count <= column {
//                indexes.removeLast()
//                continue
//            }
//            if matrix[row].count <= column + 1 || matrix[row][column] <= matrix[row][column + 1] {
//                var tmpRow: Int = row
//                while tmpRow + 1 < matrix.count &&
//                        (matrix[tmpRow][indexes[getIndexesIndex(tmpRow)]] > matrix[tmpRow + 1][indexes[getIndexesIndex(tmpRow + 1)]] || indexes[getIndexesIndex(tmpRow)] != 0) {
//                    if matrix[row][indexes[getIndexesIndex(row)]] > matrix[tmpRow + 1][indexes[getIndexesIndex(tmpRow + 1)]] {
//                        row = tmpRow + 1
//                    }
//                    tmpRow += 1
//                }
//                if matrix[row][indexes[getIndexesIndex(row)]] > matrix[tmpRow][indexes[getIndexesIndex(tmpRow)]] {
//                    row = tmpRow
//                }
//            }
//            tmpK += 1
//            if tmpK == k { return matrix[row][indexes[getIndexesIndex(row)]] }
//            indexes[getIndexesIndex(row)] += 1
//        }
//    }
    private struct Example {
        let matrix: [[Int]]
        let k: Int
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(matrix: [[1,5,9],
                           [10,11,13],
                           [12,13,15]],
                  k: 8,
                  res: 13),
            .init(matrix: [[-5]],
                  k: 1,
                  res: -5),
            .init(matrix: [[1,4,7,11,15],
                           [2,5,8,12,19],
                           [3,6,9,16,22],
                           [10,13,14,17,24],
                           [18,21,23,26,30]
                          ],
                  k: 20,
                  res: 21),
            .init(matrix: [[1,2],[1,3]], k: 2, res: 1),
            .init(matrix: [[1,2],[1,3]], k: 4, res: 3),
            .init(matrix: [[1,3,5],
                           [6,7,12],
                           [11,14,14]], k: 6, res: 11),
            .init(matrix: [[1,2],[3,3]], k: 2, res: 2)
        ]
        for (i, ex) in examples.enumerated() {
            if kthSmallest(ex.matrix, ex.k) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
