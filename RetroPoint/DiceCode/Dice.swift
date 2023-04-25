// @copyright André Trettin

import Foundation

public struct Dice: Equatable, Hashable {
    public var modifier: Int = 0
    private var dieCounters: [DieCounter] = []

    public init(die: Die, modifier: Int = 0) {
        self.modifier = modifier
        addDie(die)
    }

    public init(dice: [Die], modifier: Int = 0) {
        self.modifier = modifier
        dice.forEach { addDie($0) }
    }

    public init(dieCounter: DieCounter, modifier: Int = 0) {
        self.modifier = modifier
        addDie(dieCounter)
    }

    public init(dieCounters: [DieCounter], modifier: Int = 0) {
        self.modifier = modifier
        dieCounters.forEach { addDie($0) }
    }

    public init(text: String) {
        let result = parse(text)
        dieCounters = result.0
        modifier = result.1
    }

    public mutating func addDie(_ dieCounter: DieCounter) {
        guard let existingIndex = dieCounters.firstIndex(where: { $0.die.sides == dieCounter.die.sides }) else {
            dieCounters.append(dieCounter)
            return
        }
        var existingDie = dieCounters[existingIndex]
        existingDie.count += dieCounter.count
        if existingDie.count == 0 {
            dieCounters.remove(at: existingIndex)
        } else {
            dieCounters[existingIndex] = existingDie
        }
    }

    public mutating func addDie(_ die: Die) {
        addDie(DieCounter(die: die))
    }

    public mutating func removeDie(_ dieCounter: DieCounter) {
        guard let existingIndex = dieCounters.firstIndex(where: { $0.die.sides == dieCounter.die.sides }) else {
            return
        }
        var existingDie = dieCounters[existingIndex]
        existingDie.count -= dieCounter.count
        if existingDie.count == 0 {
            dieCounters.remove(at: existingIndex)
        } else {
            dieCounters[existingIndex] = existingDie
        }
    }

    public mutating func removeDie(_ die: Die) {
        removeDie(DieCounter(die: die))
    }

    public func role() -> Int {
        var result = 0
        dieCounters.forEach { result += $0.role() }
        return result + modifier
    }

    public var min: Int {
        var result = 0
        dieCounters.forEach { result += $0.min }
        return result + modifier
    }

    public var max: Int {
        var result = 0
        dieCounters.forEach { result += $0.max }
        return result + modifier
    }

    public var text: String {
        var result = ""
        dieCounters.forEach {
            let text = $0.text
            if $0.count > 0 {
                result += "+"
            }
            result += text
        }
        if modifier > 0 {
            result += "+\(modifier)"
        } else if modifier < 0 {
            result += "\(modifier)"
        }
        if result.hasPrefix("+") {
            result = String(result.dropFirst())
        }
        return result
    }

    private func parse(_ text: String) -> ([DieCounter], Int) {
        var modifier = 0
        var dieCounters: [DieCounter] = []

        var modifierText = text

        let diePattern = "(?<Die>[+\\-]?[0-9]*d[0-9]+)"
        let dieResults = RegularExpressionParser.parse(text, with: diePattern, extract: ["Die"])
        dieResults.forEach {
            dieCounters.append(DieCounter(text: $0))
            modifierText = modifierText.replacingOccurrences(of: $0, with: "")
        }

        let modifierPattern = "(?<Modifier>[+\\-]+[0-9]+)"
        let modifierResults = RegularExpressionParser.parse(modifierText, with: modifierPattern, extract: ["Modifier"])
        modifierResults.forEach {
            if let number = Int($0) {
                modifier += number
            }
        }
        return (dieCounters, modifier)
    }
}
