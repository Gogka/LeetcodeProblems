//
//  WordSearch.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 11.01.2023.
//

import Foundation

struct WordSearch {
    /// ✅ https://leetcode.com/problems/word-search/description/
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        if board.isEmpty { return false }
        let word: [Character] = .init(word)
        var checkBoard: [[Bool]] = .init(repeating: .init(repeating: false, count: board[0].count), count: board.count)
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if find(board: board, i: i, j: j, charIndex: 0, word: word, checkBoard: &checkBoard) {
                    return true
                }
            }
        }
        return false
    }
    func find(board: [[Character]],
              i: Int,
              j: Int,
              charIndex: Int,
              word: [Character],
              checkBoard: inout [[Bool]]) -> Bool {
        if board[i][j] != word[charIndex] { return false }
        if charIndex + 1 == word.count { return true }
        checkBoard[i][j] = true
        func check(newI: Int, newJ: Int) -> Bool {
            checkIfIJValid(i: newI, j: newJ, board: board) &&
            !checkBoard[newI][newJ] &&
            find(board: board, i: newI, j: newJ, charIndex: charIndex + 1, word: word, checkBoard: &checkBoard)
        }
        /// top
        if check(newI: i - 1, newJ: j) { return true }
        /// bottom
        if check(newI: i + 1, newJ: j) { return true }
        /// right
        if check(newI: i, newJ: j + 1) { return true }
        /// left
        if check(newI: i, newJ: j - 1) { return true }
        ///
        checkBoard[i][j] = false
        return false
    }
    func checkIfIJValid(i: Int, j: Int, board: [[Character]]) -> Bool {
        i >= 0 && board.count > i && j >= 0 && board.first!.count > j
    }
    private struct Example {
        let board: [[Character]]
        let word: String
        let res: Bool
    }
    func test() {
        let examples: [Example] = [
            .init(
                board: [
                    ["A","B","C","E"],
                    ["S","F","C","S"],
                    ["A","D","E","E"]],
                word: "ABCCED", res: true),
            .init(
                board: [
                    ["A","B","C","E"],
                    ["S","F","C","S"],
                    ["A","D","E","E"],
                ],
                word: "SEE", res: true),
            .init(
                board: [
                    ["A","B","C","E"],
                    ["S","F","C","S"],
                    ["A","D","E","E"]
                ],
                word: "ABCB", res: false),
            .init(
                board: [
                    ["a"],
                ],
                word: "a", res: true),
        ]
        for (i, ex) in examples.enumerated() {
            if exist(ex.board, ex.word) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
