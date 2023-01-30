//
//  Queue.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation

protocol Queue {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
}

struct ArrayQueue<Element>: Queue, ExpressibleByArrayLiteral, CustomStringConvertible {
    typealias ArrayLiteralElement = Element
    private var arr: [Element]
    var description: String { arr.description }
    var peek: Element? { arr.first }
    var isEmpty: Bool { arr.isEmpty }
    init() {
        self.arr = []
    }
    init(arrayLiteral elements: ArrayLiteralElement...) {
        self.arr = elements
    }
    mutating func enqueue(_ element: Element) -> Bool {
        arr.append(element)
        return true
    }
    mutating func dequeue() -> Element? {
        isEmpty ? nil : arr.removeFirst()
    }
}
struct LinkedListQueue<Element>: Queue, ExpressibleByArrayLiteral, CustomStringConvertible {
    var description: String { linkedList.description }
    typealias ArrayLiteralElement = Element
    private var linkedList: LinkedList<Element>
    var peek: Element? { linkedList.head?.value }
    var isEmpty: Bool { linkedList.isEmpty }
    init() {
        linkedList = .init()
    }
    init(arrayLiteral elements: ArrayLiteralElement...) {
        linkedList = .init(array: elements)
    }
    mutating func enqueue(_ element: Element) -> Bool {
        linkedList.append(element)
        return true
    }
    mutating func dequeue() -> Element? {
        linkedList.pop()
    }
}
