//
//  File.swift
//  
//
//  Created by Jan Ruhlaender on 31.05.20.
//

import Foundation

/// Resolves a SiPrefix for a given number
public class SiPrefixResolver {

    private let resolveMap: [Int:SiPrefix]
    private let minPrefix: SiPrefix
    private let maxPrefix: SiPrefix

    /// creates a new resolver instance
    /// - Parameter resolveMap: used dictionary for resolving prefixes
    public init(resolveMap: [Int:SiPrefix]) {
        self.resolveMap = resolveMap
        self.minPrefix  =  resolveMap.values.min()!
        self.maxPrefix  = resolveMap.values.max()!
    }

    /// resolves the SiPrefix for the given number
    /// - Parameter value: value for which the most suitable SiPrefix should be determined
    /// - Returns: the most suitable SiPrefix, or the .none SiPrefix
    public func resolve(for value: Double) -> SiPrefix {
        guard value != 0 else { return .none }
        guard value > minPrefix.factor else { return minPrefix }
        guard value < maxPrefix.factor else { return maxPrefix }

        let siExponent = resolveSiExponent(for: value)
        return resolveMap[siExponent] ?? .none
    }

    private func resolveSiExponent(for value: Double) -> Int {
        let absValue = abs(value)
        let exponent = log10(absValue)
        let siExponent = Int(floor(exponent / 3)) * 3
        return siExponent
    }
}

public extension SiPrefixResolver {

    /// Default SiPrefix resolver that resolves from pico (10^-12) up to peta (10^15)
    static let `default` = SiPrefixResolver(resolveMap: [-12:.pico, -9:.nano, -6:.micro, -3:.milli,
                                                         0:.none,
                                                         3:.kilo, 6:.mega, 9:.giga, 12:.tera, 15:.peta])
}
