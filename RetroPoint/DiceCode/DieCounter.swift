// @copyright André Trettin

import Foundation

public struct DieCounter: Equatable, Hashable {
    public var count: Int
    public let die: Die

    public init(die: Die = Die.twenty, count: Int = 1) {
        self.die = die
        self.count = count
    }

    public init(text: String) {
        count = 1
        let pattern = "(?<Count>[\\-0-9]*)(?<Die>d)(?<Sides>[0-9]+)"
        let results = RegularExpressionParser.parse(text, with: pattern, extract: ["Count"])
        if results.count == 1 {
            if results[0] == "-" {
                count = -1
            } else if let number = Int(results[0]) {
                count = number
            }
        }
        die = Die(text: text)
    }

    public func role() -> Int {
        var result = 0
        (1 ... abs(count)).forEach { _ in result += die.role() }
        if count < 0 {
            result *= -1
        }
        return result
    }

    public var min: Int {
        count * die.min
    }

    public var max: Int {
        count * die.max
    }

    public var text: String {
        if count == 1 {
            return die.text
        }
        return "\(count)\(die.text)"
    }
}
