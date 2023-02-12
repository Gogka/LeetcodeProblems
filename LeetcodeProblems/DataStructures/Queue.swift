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
struct DictionaryQueue<Element>: Queue, ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Element
    private var startIndex: Int = 0
    private var dictionary: [Int: Element] = [:]
    var count: Int { dictionary.count }
    var isEmpty: Bool { dictionary.isEmpty }
    var peek: Element? { dictionary[startIndex] }
    init() {
        self.init(size: 0)
    }
    init(size: Int) {
        dictionary = [:]
        dictionary.reserveCapacity(size)
    }
    init(arrayLiteral elements: ArrayLiteralElement...) {
        dictionary = [:]
        dictionary.reserveCapacity(elements.count)
        elements.enumerated().forEach { dictionary[$0.offset] = $0.element }
    }
    mutating func enqueue(_ element: Element) -> Bool {
        dictionary[startIndex + count] = element
        return true
    }
    mutating func dequeue() -> Element? {
        let returned: Element? = dictionary.removeValue(forKey: startIndex)
        if isEmpty {
            startIndex = 0
        } else {
            startIndex += 1
        }
        return returned
    }
}
