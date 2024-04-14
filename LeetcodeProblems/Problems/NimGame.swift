//
//  NimGame.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.04.2024.
//

import Foundation

final class NimGame {
//    var cache = [Int: Bool]()
    /// ✅ https://leetcode.com/problems/nim-game/description/
    func canWinNim(_ n: Int) -> Bool {
        n % 4 != 0
//        if n <= 0 { return false }
//        if n < 4 { return true }
////        if let cached = cache[n] { return cached }
//        let canWin = canWinNim(n - 2) || canWinNim(n - 3) || canWinNim(n - 4)
////        cache[n] = canWin
//        return canWin
    }
}
