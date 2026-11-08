// PhoneRules.swift
// GeoKit

import PhoneNumberKit

/// The phone number formatting rules for a country.
public struct PhoneRules: Sendable {
    /// The country calling code, e.g. `33` for France.
    public let dialCode: Int

    /// The country calling code with its leading `+`, e.g. `"+33"`.
    public let prefix: String

    /// An example number in international format, suitable as a text field placeholder,
    /// e.g. `"+33 6 12 34 56 78"`.
    public let placeholder: String

    /// An example number in national format, suitable as a text field placeholder,
    /// e.g. `"06 12 34 56 78"`.
    public let nationalPlaceholder: String
}

public extension Country {
    /// This country's phone number formatting rules.
    var phoneRules: PhoneRules {
        let utility = PhoneNumberUtility.shared
        let dialCode = utility.countryCode(for: code).map(Int.init) ?? 0
        return PhoneRules(
            dialCode: dialCode,
            prefix: "+\(dialCode)",
            placeholder: utility.exampleNumber(forCountry: code, format: .international) ?? "+\(dialCode)",
            nationalPlaceholder: utility.exampleNumber(forCountry: code, format: .national) ?? ""
        )
    }
}

private extension PhoneNumberUtility {
    /// Tries mobile, fixed line, then any other number type until one has a formatted example.
    func exampleNumber(forCountry countryCode: String, format: PhoneNumberFormat) -> String? {
        for type: PhoneNumberType in [.mobile, .fixedLine, .fixedOrMobile] {
            if let example = self.getFormattedExampleNumber(forCountry: countryCode, ofType: type, withFormat: format) {
                return example
            }
        }
        return nil
    }
}
