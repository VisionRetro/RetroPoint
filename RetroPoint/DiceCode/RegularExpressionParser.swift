// @copyright André Trettin

import Foundation

public enum RegularExpressionParser {
    public static func parse(_ line: String, with pattern: String, extract components: [String]) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            assertionFailure("Cannot initialize Regex")
            return []
        }
        let nsrange = NSRange(line.startIndex ..< line.endIndex,
                              in: line)
        var result: [String] = []

        regex.enumerateMatches(in: line, options: [], range: nsrange) { match, _, _ in
            guard let match else { return }

            for component in components {
                let nsrange = match.range(withName: component)
                if nsrange.location != NSNotFound,
                   let range = Range(nsrange, in: line)
                {
                    result.append(String(line[range]))
                } else {
                    result.append("")
                }
            }
        }
        return result
    }
}
