// PhoneNumberValidator.swift
// GeoKit

import PhoneNumberKit

/// Identifies and validates phone numbers against each country's numbering plan.
public enum PhoneNumberValidator {
    /// The most likely country for a phone number, found from its dial code, e.g. `"+33 6…"` → `.fr`.
    ///
    /// When several countries share a dial code (e.g. `+1` for the US, Canada, and others), the main
    /// country for that code is returned. Use `countries(from:)` to get every match.
    public static func country(from input: String) -> Country? {
        guard let dialCode = PhoneNumberValidator.dialCode(in: input) else {
            return nil
        }
        return PhoneNumberUtility.shared.mainCountry(forCode: dialCode).flatMap(Country.init(code:))
    }

    /// Every country that shares the dial code found in a phone number, e.g. `"+1…"` → `[.us, .ca, …]`.
    public static func countries(from input: String) -> [Country] {
        guard let dialCode = PhoneNumberValidator.dialCode(in: input) else {
            return []
        }
        return (PhoneNumberUtility.shared.countries(withCode: dialCode) ?? []).compactMap(Country.init(code:))
    }

    /// Whether `number` is a valid phone number for `country`.
    public static func isValid(_ number: String, country: Country) -> Bool {
        PhoneNumberUtility.shared.isValidPhoneNumber(number, withRegion: country.code)
    }

    /// Whether `number` is a valid phone number for the country identified by `countryCode`
    /// (an ISO 3166-1 alpha-2 or alpha-3 code). Returns `false` if `countryCode` isn't recognized.
    public static func isValid(_ number: String, countryCode: String) -> Bool {
        guard let country = Country(code: countryCode) else {
            return false
        }
        return isValid(number, country: country)
    }

    /// An example phone number for `country`, suitable as a text field placeholder.
    public static func placeholder(for country: Country, format: PhoneFormat = .international) -> String {
        format == .national ? country.phoneRules.nationalPlaceholder : country.phoneRules.placeholder
    }

    /// An example phone number for the country identified by `countryCode`, or `nil` if the code
    /// isn't recognized.
    public static func placeholder(forCountryCode countryCode: String, format: PhoneFormat = .international) -> String? {
        guard let country = Country(code: countryCode) else {
            return nil
        }
        return placeholder(for: country, format: format)
    }

    /// Finds the longest leading sequence of digits in `input` that matches an assigned country
    /// calling code (dial codes are one to three digits).
    private static func dialCode(in input: String) -> UInt64? {
        let digits = input.filter(\.isNumber)
        guard !digits.isEmpty else {
            return nil
        }
        for length in stride(from: min(3, digits.count), through: 1, by: -1) {
            guard let candidate = UInt64(digits.prefix(length)) else { continue }
            if let countries = PhoneNumberUtility.shared.countries(withCode: candidate), !countries.isEmpty {
                return candidate
            }
        }
        return nil
    }
}
