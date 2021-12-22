import Foundation

public class Day1: Day {
    public var result: Result?
    
    public init() { }
    
    public func process() {
        let content = "input-day1".openFile
        let lines = content.split(separator: "\n").compactMap { Int($0) }
        
        self.result = Result(day: 1,
                           numberOfLines: lines.count,
                           solution1: { lines.countGreaterThanMultiple() },
                           solution2: { lines.countGreaterThanMultiple(rows: 3) })
        self.showResult()
    }
}

extension Array where Element == Int {

    func countGreaterThanMultiple(rows: Int = 1) -> Int {
        var previous: Int = sumNextAmount(index: 0, amount: rows)
        var count = 0

        for index in 1..<self.count {
            let lastPrevious = previous
            previous = sumNextAmount(index: index, amount: rows)
            if previous > lastPrevious {
                count += 1
            }
        }
        return count
    }

    private func sumNextAmount(index: Int, amount: Int) -> Int {
        var accumulator = 0
        for currentIndex in index..<(index+amount) {
            if currentIndex < count {
                accumulator += self[currentIndex]
            }
        }
        return accumulator
    }
}
