//
//  File.swift
//  
//
//  Created by Jan Ruhlaender on 31.05.20.
//

import Foundation

public class SiNumberFormatter {

    private let numberFormatter: NumberFormatter
    private let siResolver: SiPrefixResolver
    private let delimiter: String
    private let unitSymbol: String

    public var forcedPrefix: SiPrefix?
    public var fractionDigits: Int {
        get {
            numberFormatter.maximumFractionDigits
        }
        set {
            numberFormatter.maximumFractionDigits = newValue
            numberFormatter.minimumFractionDigits = newValue
        }
    }

    public var thousandsSeparator: String {
        get {
            numberFormatter.groupingSeparator
        }
        set {
            numberFormatter.groupingSeparator = newValue
        }
    }

    public var decimalSeparator: String {
        get {
            numberFormatter.decimalSeparator
        }
        set {
            numberFormatter.decimalSeparator = newValue
        }
    }

    public init(unitSymbol: String = "",
                delimiter: String = " ",
                siResolver: SiPrefixResolver = SiPrefixResolver.default) {
        self.siResolver = siResolver
        self.numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = "\u{2009}"
        numberFormatter.decimalSeparator = "."
        
        numberFormatter.minimumFractionDigits = 3
        numberFormatter.maximumFractionDigits = 3
        self.unitSymbol = unitSymbol
        self.delimiter = delimiter
    }

    public func string(for value: Double) -> String {
        let si = forcedPrefix ?? siResolver.resolve(for: value)

        let usedNumber = value / si.factor
        let formattedNumber = numberFormatter.string(from: NSNumber(value: usedNumber)) ?? "0"

        return "\(formattedNumber)\(delimiter)\(si.symbol)\(unitSymbol)"
    }
}
