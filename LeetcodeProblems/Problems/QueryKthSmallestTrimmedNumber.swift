//
//  QueryKthSmallestTrimmedNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 11.01.2023.
//

import Foundation

struct QueryKthSmallestTrimmedNumber {
    /// ✅ https://leetcode.com/problems/query-kth-smallest-trimmed-number/description/
    func smallestTrimmedNumbers(_ nums: [String], _ queries: [[Int]]) -> [Int] {
        let digitsCount: Int = nums.first!.count
        var sortedResults: [Int: [Int]] = [:]
        var sortedArray: [[Int]] = nums.map { $0.map { Int("\($0)")! } }
        /// Make radix sort and for each trim level save sorted indexes to sortedResults
        for i in 0..<digitsCount {
            let leastSignificantDigit: Int = digitsCount - i - 1
            /// Available digits is from 0 to 9
            var indexes: [Int] = .init(repeating: 0, count: 10)
            for j in 0..<sortedArray.count {
                indexes[sortedArray[j][leastSignificantDigit]] += 1
            }
            var sum: Int = indexes[0]
            indexes[0] = 0
            for i in 1..<indexes.count {
                let val: Int = indexes[i]
                indexes[i] = sum
                sum += val
            }
            var sortedResult: [Int] = .init(repeating: 0, count: sortedArray.count)
            var newSortedArray: [[Int]] = .init(repeating: [], count: sortedArray.count)
            for j in 0..<sortedArray.count {
                let index: Int = indexes[sortedArray[j][leastSignificantDigit]]
                sortedResult[index] = j
                newSortedArray[index] = sortedArray[j]
                indexes[sortedArray[j][leastSignificantDigit]] += 1
            }
            sortedArray = newSortedArray
            sortedResults[leastSignificantDigit] = sortedResult
        }
        var result: [Int] = .init(repeating: 0, count: queries.count)
        /// We can origin indexes in digitsCount - 1 trim. So we need to find it from previous trims
        for i in 0..<queries.count {
            let k: Int = queries[i].first!
            let trim: Int = queries[i].last!
            var index: Int = k - 1
            var startTrim: Int = digitsCount - trim
            while startTrim <= digitsCount - 1 {
                index = sortedResults[startTrim]![index]
                startTrim += 1
            }
            result[i] = index
        }
        return result
    }
    private struct Example {
        let nums: [String]
        let queires: [[Int]]
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(nums: ["102","473","251","814"], queires: [[1,1],[2,3],[4,2],[1,2]], res: [2,2,1,0]),
            .init(nums: ["24","37","96","04"], queires: [[2,1],[2,2]], res: [3,0])
        ]
        for (i, ex) in examples.enumerated() {
            if smallestTrimmedNumbers(ex.nums, ex.queires) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
