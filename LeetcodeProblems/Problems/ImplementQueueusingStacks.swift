//
//  ImplementQueueusingStacks.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 09.02.2023.
//

import Foundation

struct ImplementQueueusingStacks {
    /// ✅ https://leetcode.com/problems/implement-queue-using-stacks/description/
    class MyQueue {
        private var firstStack: [Int]
        private var secondStack: [Int]
        private var isSecondWrittable: Bool = false
        init() {
            firstStack = []
            secondStack = []
        }
        func push(_ x: Int) {
            if isSecondWrittable {
                secondStack.append(x)
            } else {
                firstStack.append(x)
            }
        }
        func pop() -> Int {
            if isSecondWrittable {
                if firstStack.isEmpty {
                    rearrangeFirst()
                }
                return firstStack.removeLast()
            } else {
                if secondStack.isEmpty {
                    rearrangeSecond()
                }
                return secondStack.removeLast()
            }
        }
        func peek() -> Int {
            if isSecondWrittable {
                if firstStack.isEmpty {
                    rearrangeFirst()
                }
                return firstStack.last!
            } else {
                if secondStack.isEmpty {
                    rearrangeSecond()
                }
                return secondStack.last!
            }
        }
        func empty() -> Bool {
            firstStack.isEmpty && secondStack.isEmpty
        }
        private func rearrangeFirst() {
            while !secondStack.isEmpty {
                firstStack.append(secondStack.removeLast())
            }
            isSecondWrittable = true
        }
        private func rearrangeSecond() {
            while !firstStack.isEmpty {
                secondStack.append(firstStack.removeLast())
            }
            isSecondWrittable = false
        }
    }
}
