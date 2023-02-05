//
//  Stack.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation

struct Stack<Element>: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    private var array: [Element]
    var top: Element? { array.last }
    init(size: Int) {
        array = []
        array.reserveCapacity(size)
    }
    init(arrayLiteral elements: ArrayLiteralElement...) {
        array = elements
    }
    mutating func push(_ element: Element) {
        array.append(element)
    }
    @discardableResult
    mutating func pop() -> Element? {
        if array.isEmpty { return nil }
        return array.removeLast()
    }
}
