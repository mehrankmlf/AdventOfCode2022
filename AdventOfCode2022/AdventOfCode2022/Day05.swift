//
//  Day05.swift
//  AdventOfCode2022
//
//  Created by Mehran Kamalifard on 6/3/23.
//

import Foundation

struct Day05: Solution {
    
    var input: String
    
    init(input: String) {
        self.input = input
    }
    
    func temp() {
        let input = self.fetchRawData

        var s: [[Character]] = []

        let lines = input.components(separatedBy: "\n")

        var maxLength = 0

        for line in lines {
            if line == "" { break }
            let characters = Array(line.enumerated().compactMap { $0.offset % 4 == 1 ? $0.element : nil })
            maxLength = max(maxLength, characters.count)
            s.append(characters)
        }
        print(s)
        for i in 0..<s.count {
            let paddingCount = maxLength - s[i].count
            if paddingCount > 0 {
                s[i] += Array(repeating: " ", count: paddingCount)
            }
        }
        s.removeLast()

        let xx = s.max(by: { $0.count < $1.count })?.count ?? 0

        let paddedInput = s.map { $0 + Array(repeating: " ", count: xx - $0.count) }

        let verticalFormat = (0..<xx).map { index in
            paddedInput.compactMap { $0.indices.contains(index) ? $0[index] : nil }
        }

        let expectedResult = verticalFormat.map { String($0.filter { $0 != " " }) }
        print(expectedResult)
        let expectedOutput1 = expectedResult.map { String($0.reversed()) }
        print(expectedOutput1)
        var output = expectedOutput1.map { str in
            str.map { String($0) }
        }
        print(output)
        
        var expectedOutput: [[Int]] = []

        var isMoveSection = false

        for line in lines {
            if line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                isMoveSection = true
                continue
            }
            
            if isMoveSection {
                expectedOutput.append(line.allNumbers)
//             expectedOutput.append(line.parseToInt()!)
//                expectedOutput = line.allNumbers
//
                print(line.allNumbers)
            }
        }
        print(expectedOutput)
        expectedOutput.forEach { row in
            let tuple = (row[0], row[1], row[2])
            output[tuple.2  - 1].append(contentsOf: output[tuple.1 - 1].suffix(tuple.0).reversed())
            output[tuple.1 - 1].removeLast(tuple.0)
        }

        var result: [String] = []
        result = output.map { $0.last! }

        print(result.joined())
    }
}
