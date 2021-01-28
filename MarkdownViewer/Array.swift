import Foundation
import CommonMark

extension Array where Element == NSAttributedString {
    func join() -> NSAttributedString {
        return reduce(into: NSMutableAttributedString()) { (result, element) in
            result.append(element)
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index > -1 && index < count else {
            return nil
        }
        
        return self[index]
    }
}
