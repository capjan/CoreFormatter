//
//  File 2.swift
//  
//
//  Created by Jan Ruhlaender on 31.05.20.
//

import Foundation

public struct SiPrefix {
    public let name: String
    public let symbol: String
    public let factor: Double
    public let exponent: Int
}

public extension SiPrefix {
    static let none  = SiPrefix(name: "none", symbol: "", factor: 1, exponent: 0)
    
    static let kilo  = SiPrefix(name: "kilo",  symbol: "k", factor: 1000, exponent: 3)
    static let mega  = SiPrefix(name: "mega",  symbol: "M", factor: 1000000, exponent: 6)
    static let giga  = SiPrefix(name: "giga",  symbol: "G", factor: 1000000000, exponent: 9)
    static let tera  = SiPrefix(name: "tera",  symbol: "T", factor: 1000000000000, exponent: 12)
    static let peta  = SiPrefix(name: "peta",  symbol: "P", factor: 1000000000000000, exponent: 15)

    // static let exa   = SiPrefix(name: "exa",   symbol: "E", factor: 1000000000000000000, exponent: 18)
    // static let zetta = SiPrefix(name: "zetta", symbol: "Z", factor: 1000000000000000000000, exponent: 21)
    // static let yotta = SiPrefix(name: "yotta", symbol: "Y", factor: 1000000000000000000000000, exponent: 24)

    static let milli = SiPrefix(name: "milli", symbol: "m", factor: 0.001, exponent: -3)
    static let micro = SiPrefix(name: "micro", symbol: "µ", factor: 0.000001, exponent: -6)
    static let nano  = SiPrefix(name: "nano",  symbol: "n", factor: 0.000000001, exponent: -9)
    static let pico  = SiPrefix(name: "pico",  symbol: "p", factor: 0.000000000001, exponent: -12)
    
    // static let femto = SiPrefix(name: "femto", symbol: "f", factor: 0.000000000000001, exponent: -15)
    // static let atto  = SiPrefix(name: "atto",  symbol: "a", factor: 0.000000000000000001, exponent: -18)
    // static let zepto = SiPrefix(name: "zepto", symbol: "z", factor: 0.000000000000000000001, exponent: -21)
    // static let yocto = SiPrefix(name: "yocto", symbol: "y", factor: 0.000000000000000000000001, exponent: -24)
}

extension SiPrefix: Comparable {
    public static func < (lhs: SiPrefix, rhs: SiPrefix) -> Bool {
        lhs.exponent < rhs.exponent
    }
}
