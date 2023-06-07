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

    // Extracts characters from lines starting from startIndex
    func extractCharacters(lines: [String], startIndex: Int) -> [[Character]] {
        var collectionOfChar: [[Character]] = []

        for line in lines[startIndex...] {
            guard !line.isEmpty else { break }
            let characters = Array(line.enumerated().compactMap { $0.offset % 4 == 1 ? $0.element : nil })
            collectionOfChar.append(characters)
        }

        return collectionOfChar
    }

    // Pads the characters to ensure consistent lengths
    func padCharacters(collectionOfChar: [[Character]]) -> [[Character]] {
        let maxLength = collectionOfChar.map(\.count).max() ?? 0
        let paddedInput = collectionOfChar.map { $0 + Array(repeating: " ", count: maxLength - $0.count) }
        return paddedInput
    }

    // Transposes the characters to get vertical format
    func transposeCharacters(paddedInput: [[Character]]) -> [[Character]] {
        let maxLength = paddedInput.first?.count ?? 0
        let verticalFormat = (0..<maxLength).map { index in
            paddedInput.compactMap { $0.indices.contains(index) ? $0[index] : nil }
        }
        return verticalFormat
    }

    // Reverses the characters in vertical format
    func reverseCharacters(verticalFormat: [[Character]]) -> [String] {
        let expectedResult = verticalFormat.map { String($0.filter { $0 != " " }) }
        let reversedExpectedResult = expectedResult.map { String($0.reversed()) }
        return reversedExpectedResult
    }

    // Converts reversed strings to character arrays
    func convertToCharacterArrays(reversedExpectedResult: [String]) -> [[String]] {
        let output = reversedExpectedResult.map { str in
            str.map { String($0) }
        }
        return output
    }

    // Extracts the expected output from lines
    func extractExpectedOutput(lines: [String]) -> [[Int]] {
        var expectedOutput: [[Int]] = []
        var isMoveSection = false

        for line in lines {
            if line.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                isMoveSection = true
                continue
            }

            if isMoveSection {
                expectedOutput.append(line.allNumbers)
            }
        }

        return expectedOutput
    }

    // Processes the expected output and modifies the output array
    func processExpectedOutput(expectedOutput: [[Int]], output: inout [[String]]) {
        for row in expectedOutput {
            let (x, y, z) = (row[0], row[1], row[2])
            output[z - 1].append(contentsOf: output[y - 1].suffix(x).reversed())
            output[y - 1].removeLast(x)
        }
    }
    
    // Extracts the result from the output array
    func extractResult(output: [[String]]) -> String {
        let result = output.map { $0.last ?? "" }
        return result.joined()
    }
}

extension Day05: Puzzels {
    func puzzleOne() {
        let input = self.fetchRawData
        let lines = input.components(separatedBy: "\n")

        guard let firstNonEmptyLineIndex = lines.firstIndex(where: { !$0.isEmpty }) else {
            print("No non-empty lines found.")
            return
        }

        let collectionOfChar = extractCharacters(lines: lines, startIndex: firstNonEmptyLineIndex)
        let paddedInput = padCharacters(collectionOfChar: collectionOfChar)
        let verticalFormat = transposeCharacters(paddedInput: paddedInput)
        let reversedExpectedResult = reverseCharacters(verticalFormat: verticalFormat)
        let expectedOutput = extractExpectedOutput(lines: lines)
        var output = convertToCharacterArrays(reversedExpectedResult: reversedExpectedResult)
       

        processExpectedOutput(expectedOutput: expectedOutput, output: &output)

        let result = extractResult(output: output)
        print(result)
    }
    
    func puzzleTwo() {
        print("")
    }
}
