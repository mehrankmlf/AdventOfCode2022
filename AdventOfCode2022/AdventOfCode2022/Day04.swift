//
//  Day04.swift
//  AdventOfCode2022
//
//  Created by Mehran Kamalifard on 5/30/23.
//

import Foundation

struct Day04: Solution {
    
    var input: String
    
    init(input: String) {
        self.input = input
    }
    
    private func isContainedPuzzleOne(left: Range<Int>, right: Range<Int>) -> Bool {
        return left.lowerBound <= right.lowerBound && right.upperBound <= left.upperBound
    }
    
    private func isContainedPuzzleTwo(left: Range<Int>, right: Range<Int>) -> Bool {
        return left.lowerBound <= right.upperBound && left.upperBound >= right.lowerBound
    }
}

extension Day04: Puzzels {
    func puzzleOne() {
        let input = self.fetchData.filter { !$0.isEmpty }
        var sum = 0
        
        for item in input {
            let splitElfs = item.split(separator: ",").map { $0.split(separator: "-") }

            let range1 = Int(splitElfs[0][0])!..<Int(splitElfs[0][1])!
            let range2 = Int(splitElfs[1][0])!..<Int(splitElfs[1][1])!

            if isContainedPuzzleOne(left: range1, right: range2) ||
                isContainedPuzzleOne(left: range2, right: range1) {
                sum += 1
            }
        }
        print(sum)
    }
    
    func puzzleTwo() {
        let input = self.fetchData.filter { !$0.isEmpty }
        var sum = 0

        for item in input {
            let splitElfs = item.split(separator: ",").map { $0.split(separator: "-") }

            let range1 = Int(splitElfs[0][0])!..<Int(splitElfs[0][1])!
            let range2 = Int(splitElfs[1][0])!..<Int(splitElfs[1][1])!

            if isContainedPuzzleTwo(left: range1, right: range2) {
                sum += 1
            }
        }
        print(sum)
    }
}

