//
//  Extension.swift
//  Day01
//
//  Created by Mehran on 3/4/1402 AP.
//

import Foundation

public extension String {
    func contentsOrBlank() -> String {
        if let path = Bundle.main.path(forResource:self , ofType: nil) {
            do {
                let text = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                return text
            } catch { print("Failed to read text from bundle file \(self)") }
        } else { print("Failed to load file from bundle \(self)") }
        return ""
    }
}


extension String {
    var allNumbers: [Int] {
        let numbersInString = self.components(separatedBy: .decimalDigits.inverted).filter { !$0.isEmpty }
        return numbersInString.compactMap { Int($0) }
    }
}

extension Array {
    func devided() -> ([Element], [Element]) {
        let half = count / 2 + count % 2
        let head = self[0..<half]
        let tail = self[half..<count]
        
        return (Array(head), Array(tail))
    }
}

extension Array {
    func chunk(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

extension Array {
    func windows(ofSize size: Int) -> [[Element]] {
        guard size > 0 else {
            return []
        }
        
        var windows: [[Element]] = []
        let count = self.count
        
        for i in 0...(count - size) {
            let window = Array(self[i..<(i + size)])
            windows.append(window)
        }
        
        return windows
    }
}
