//
//  Day06.swift
//  AdventOfCode2022
//
//  Created by Mehran Kamalifard on 6/7/23.
//

import Foundation

struct Day06: Solution {
    
    var input: String
    
    init(input: String) {
        self.input = input
    }
    
    private func findStarts(input: [Character], size: Int) -> Int {
        for (i, window) in input.windows(ofSize: size).enumerated() {
            let set = Set(window)
            if set.count == size {
                return i + size
            }
        }
        return 0
    }
}

extension Day06: Puzzels {
    func puzzleOne() {
        let input = self.fetchRawData.map { $0 }
        
        let result = self.findStarts(input: input, size: 4)
        print("PuzzleOne: \(result)")
    }
    
    func puzzleTwo() {
        let input = self.fetchRawData.map { $0 }
        
        let result = self.findStarts(input: input, size: 14)
        print("PuzzleTwo: \(result)")
    }
}


