import Foundation

public struct  Result {
    let day: Int
    let solution1: () -> Int
    let solution2: () -> Int
    let numberOfLines: Int

    init(day: Int,
         numberOfLines: Int,
         solution1: @escaping () -> Int,
         solution2: @escaping () -> Int) {
        self.day = day
        self.numberOfLines = numberOfLines
        self.solution1 = solution1
        self.solution2 = solution2
    }
}
