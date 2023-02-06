//
//  DisjointSetUnion.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation

struct DisjointSetUnion<Element: Hashable> {
    private var representatives: [Element] = []
    private var indexes: [Element: Int] = [:]
    private var sizes: [Int] = []
    mutating func makeSet(from element: Element) {
        if indexes[element] != nil { return }
        representatives.append(element)
        sizes.append(1)
        indexes[element] = indexes.count
    }
    mutating func union(_ first: Element, and second: Element) {
        guard let firstIndex: Int = indexes[first],
              let secondIndex: Int = indexes[second],
              firstIndex != secondIndex else { return }
        let firstRepresentativeIndex: Int = findSet(for: first)!
        let secondRepresentativeIndex: Int = findSet(for: second)!
        if sizes[firstRepresentativeIndex] > sizes[secondRepresentativeIndex] {
            representatives[secondRepresentativeIndex] = representatives[firstRepresentativeIndex]
            sizes[firstRepresentativeIndex] += sizes[secondRepresentativeIndex]
        } else {
            representatives[firstRepresentativeIndex] = representatives[secondRepresentativeIndex]
            sizes[secondRepresentativeIndex] += sizes[firstRepresentativeIndex]
        }
    }
    mutating func findSet(for element: Element) -> Int? {
        findRepresentative(for: element).map { indexes[$0] } ?? nil
    }
    mutating func isInSameSet(first: Element, second: Element) -> Bool {
        findSet(for: first).map({ $0 == findSet(for: second) }) ?? false
    }
    private mutating func findRepresentative(for element: Element) -> Element? {
        guard let index: Int = indexes[element] else { return nil }
        if representatives[index] != element {
            representatives[index] = findRepresentative(for: representatives[index])!
        }
        return representatives[index]
    }
}
