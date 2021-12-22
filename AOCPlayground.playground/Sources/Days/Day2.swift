import Foundation

public class Day2: Day {
    public var result: Result?
    
    private let content: String
    
    public init(content: String = "input-day2") {
        self.content = content.openFile
    }
    
    public func process() {
        let lines = content.split(separator: "\n").compactMap(SubmarineAction.init(row:))
        self.result = Result(day: 2,
                            numberOfLines: lines.count,
                            solution1: { lines.totalPosition },
                            solution2: { lines.totalWithAim })
        self.showResult()
    }
}

struct SubmarineAction {
    enum Action: String {
        case forward
        case up
        case down
    }

    let action: Action
    let amount: Int

    init?(row: Substring) {
        let values = row.split(separator:" ")
        guard let action = Action(rawValue: String(values[0])),
              let amount = Int(values[1]) else {
            return nil
        }
        self.action = action
        self.amount = amount
    }
}

extension Array where Element == SubmarineAction {
    var totalPosition: Int {
        var aim: Int = 0
        var forward: Int = 0
        var depth: Int = 0
        for move in self {
            switch move.action {
            case .up:
                depth -= move.amount
                aim -= move.amount
            case .down:
                depth += move.amount
                aim += move.amount
            case .forward:
                forward += move.amount
            }
        }
//        print("Forward: \(forward) | depht: \(depth)")
        return forward * depth
    }

    var totalWithAim: Int {
        var aim: Int = 0
        var forward: Int = 0
        var depth: Int = 0
        for move in self {
            switch move.action {
            case .up:
                aim -= move.amount
            case .down:
                aim += move.amount
            case .forward:
                forward += move.amount
                depth += aim * move.amount
            }
        }
//        print("Forward: \(forward) | depht: \(depth) | aim: \(aim)")
        return forward * depth
    }
}
