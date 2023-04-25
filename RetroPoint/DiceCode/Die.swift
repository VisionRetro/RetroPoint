// @copyright André Trettin

public struct Die: Equatable, Hashable, Codable {
    // MARK: - static

    public static func role(_ sides: Sides) -> Int {
        Int.random(in: 1 ... sides.number())
    }

    public static func rolePercent() -> Double {
        Double.random(in: 0 ... 100)
    }

    public static var four: Die {
        Die(.four)
    }

    public static var six: Die {
        Die(.six)
    }

    public static var eight: Die {
        Die(.eight)
    }

    public static var ten: Die {
        Die(.ten)
    }

    public static var twelve: Die {
        Die(.twelve)
    }

    public static var twenty: Die {
        Die(.twenty)
    }

    // MARK: - init

    public let sides: Sides

    public init(_ sides: Sides = .twenty) {
        self.sides = sides
    }

    public init(text: String) {
        let pattern = "(?<Die>d)(?<Sides>[0-9]+)"
        let results = RegularExpressionParser.parse(text, with: pattern, extract: ["Sides"])
        if results.count == 1, let number = Int(results[0]) {
            sides = Sides.sides(number)
        } else {
            sides = .twenty
        }
    }

    public func role() -> Int {
        Int.random(in: 1 ... sides.number())
    }

    public var min: Int {
        1
    }

    public var max: Int {
        sides.number()
    }

    public var text: String {
        "d\(sides.number())"
    }

    public enum Sides: Equatable, Hashable, Codable {
        case four
        case six
        case eight
        case ten
        case twelve
        case twenty
        case number(Int)

        func number() -> Int {
            switch self {
            case .four:
                return 4
            case .six:
                return 6
            case .eight:
                return 8
            case .ten:
                return 10
            case .twelve:
                return 12
            case .twenty:
                return 20
            case let .number(sides):
                if sides < 2 {
                    return 2
                }
                return sides
            }
        }

        static func sides(_ number: Int) -> Sides {
            switch number {
            case 4:
                return .four
            case 6:
                return .six
            case 8:
                return .eight
            case 10:
                return .ten
            case 12:
                return .twelve
            case 20:
                return .twenty
            default:
                return .number(number)
            }
        }
    }
}
