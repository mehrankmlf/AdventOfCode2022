//
//  Solution.swift
//  AdventOfCode2022
//
//  Created by Mehran on 3/4/1402 AP.
//

import Foundation

protocol Solution {
    init(input: String)
    var fetchData: String {get}
}

protocol Puzzels {
    func puzzeleOne()
    func puzzleTwo()
}
