//
//  Solution.swift
//  AdventOfCode2022
//
//  Created by Mehran on 3/4/1402 AP.
//

import Foundation

protocol Solution {
    var input: String {get}
    var fetchData: [String.SubSequence] {get}
    init(input: String)
}

extension Solution {
    var fetchData: [String.SubSequence] {
        return input.contentsOrBlank()
                .trimmingCharacters(in: .whitespaces)
                .split(separator: "\n", omittingEmptySubsequences: false)
    }
}

protocol Puzzels {
    func puzzleOne()
    func puzzleTwo()
}
