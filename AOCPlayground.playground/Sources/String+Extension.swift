import Foundation

public extension String {
    var openFile: String {
        guard let fileURL = Bundle.main.url(forResource: "\(self)", withExtension: "txt") else {
            fatalError("error to open file \(self)")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            guard let content = String(data: data, encoding: .utf8) else {
                fatalError("error to convert file \(self)")
            }
            return content
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
