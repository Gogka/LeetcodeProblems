//
//  ExcelSheetColumnTitle.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.02.2023.
//

import Foundation

struct ExcelSheetColumnTitle {
    /// ✅ https://leetcode.com/problems/excel-sheet-column-title/description/
    func convertToTitle(_ columnNumber: Int) -> String {
        let alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let number: Int = columnNumber - 1
        var whole: Int = number / alphabet.count
        var string: String = ""
        let mod: Int = number % alphabet.count
        while whole != 0 {
            string = String(alphabet[alphabet.index(alphabet.startIndex, offsetBy: (whole - 1) % alphabet.count)]) + string
            whole = (whole - 1) / alphabet.count
        }
        string.append(alphabet[alphabet.index(alphabet.startIndex, offsetBy: mod)])
        return string
    }
}
