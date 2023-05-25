//
//  Day01.swift
//  AdventOfCode2022
//
//  Created by Mehran on 3/4/1402 AP.
//

import Foundation

struct Day01: Solution {

    var input: String?
    var fetchData: String {
        return input?.contentsOrBlank() ?? ""
    }
    
    init(input: String) {
        self.input = input
    }
    
    func elfs() -> [Int] {
        
        var elfs = [Int]()
        var sum = 0
        
        let lines = self.fetchData
            .trimmingCharacters(in: .whitespaces)
            .split(separator: "\n", omittingEmptySubsequences: false)
        
        for entry in lines {
            if entry != "" {
                sum += Int(entry)!
            }else if entry == "" {
                elfs.append(sum)
                sum = 0
            }
        }
        return elfs
    }
}

extension Day01: Puzzels {
    func puzzeleOne() {
        let result = self.elfs().max() ?? 0
        print("Total: \(result)")
    }
    func puzzleTwo() {
        let sorted = self.elfs().sorted { $0 > $1 }
        let topThree = Array(sorted.prefix(3))
        let result = topThree.reduce(0, +)
        print("TopThree: \(result)")
    }
}
