import Foundation

public protocol Day {
    var result: Result? { get set }
    func process()
}

extension Day {
    func showResult() {
        guard let result = result else  {
            print("*** NO RESULT FOR \(self) ***")
            return
        }
        let start = Date()
        print("*** Starting day \(result.day) ***")
        print("number of lines: \(result.numberOfLines)")
        print("result 1: \(result.solution1())")
        print("result 2: \(result.solution2())")
        print("time: \(abs(start.timeIntervalSinceNow))")
        print("*** ending day \(result.day) ***\n")
    }
}
