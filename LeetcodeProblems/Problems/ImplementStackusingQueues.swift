//
//  ImplementStackusingQueues.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 11.02.2023.
//

import Foundation

struct ImplementStackusingQueues {
    class MyStack {
        private var queue: DictionaryQueue<Int>
        private var rearranged: Bool = false
        init() {
            queue = .init()
        }
        func push(_ x: Int) {
            _ = queue.enqueue(x)
            rearranged = false
        }
        func pop() -> Int {
            if !rearranged {
                rearrange()
            }
            rearranged = false
            return queue.dequeue()!
        }
        func top() -> Int {
            if !rearranged {
                rearrange()
            }
            return queue.peek!
        }
        func empty() -> Bool {
            queue.isEmpty
        }
        private func rearrange() {
            if queue.isEmpty { return }
            for _ in 0..<queue.count - 1 {
                _ = queue.enqueue(queue.dequeue()!)
            }
            rearranged = true
        }
    }
}
