// AddressValidator.swift
// GeoKit

import Foundation

/// Validates and normalizes postal addresses against each country's `AddressRules`.
public enum AddressValidator {
    /// Whether `postcode` matches `country`'s postcode format.
    ///
    /// Whitespace and hyphens are ignored, so `"sw1a 1aa"` and `"SW1A1AA"` are equivalent. An empty
    /// postcode is valid for countries where a postcode isn't required.
    public nonisolated static func isValidPostcode(_ postcode: String, country: Country) -> Bool {
        let rules = country.addressRules
        let compact = AddressValidator.compact(postcode)
        guard !compact.isEmpty else {
            return !rules.isPostcodeRequired
        }
        guard let pattern = rules.postcodePattern else {
            return true
        }
        return compact.range(of: "^\(pattern)$", options: .regularExpression) != nil
    }

    /// `postcode` reformatted with the canonical separator for `country`, e.g. `"sw1a1aa"` becomes
    /// `"SW1A 1AA"` for the United Kingdom. Returns the trimmed, uppercased input unchanged for
    /// countries GeoKit doesn't have a canonical format for.
    public nonisolated static func normalizedPostcode(_ postcode: String, country: Country) -> String {
        let compact = AddressValidator.compact(postcode)
        guard let suffixLength = country.postcodeSuffixLength, compact.count > suffixLength else {
            return compact
        }
        let splitIndex = compact.index(compact.endIndex, offsetBy: -suffixLength)
        return "\(compact[..<splitIndex])\(country.postcodeSeparator)\(compact[splitIndex...])"
    }

    /// Whether `code` is one of `country`'s subdivisions.
    ///
    /// Accepts either the full ISO 3166-2 code (`"US-CA"`) or just its short form (`"CA"`). Countries
    /// with no known subdivision list always return `true`.
    public nonisolated static func isValidSubdivision(_ code: String, country: Country) -> Bool {
        let rules = country.addressRules
        guard rules.requiresSubdivision else {
            return true
        }
        let normalized = code.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        return rules.subdivisions.contains { $0.code == normalized || $0.shortCode == normalized }
    }

    /// Checks every field of `address` against its country's rules, returning each problem found.
    public nonisolated static func validate(_ address: Address) -> [AddressValidationError] {
        let rules = address.country.addressRules
        var errors: [AddressValidationError] = []

        if address.line1.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            errors.append(.missingLine1)
        }
        if address.city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            errors.append(.missingCity)
        }

        let postcode = address.postcode.trimmingCharacters(in: .whitespacesAndNewlines)
        if postcode.isEmpty {
            if rules.isPostcodeRequired { errors.append(.missingPostcode) }
        } else if !isValidPostcode(postcode, country: address.country) {
            errors.append(.invalidPostcode)
        }

        if rules.requiresSubdivision {
            let subdivision = address.subdivisionCode.trimmingCharacters(in: .whitespacesAndNewlines)
            if subdivision.isEmpty {
                errors.append(.missingSubdivision)
            } else if !isValidSubdivision(subdivision, country: address.country) {
                errors.append(.invalidSubdivision)
            }
        }

        return errors
    }

    /// Uppercases `value` and strips whitespace and hyphens, so postcodes can be compared regardless
    /// of how they were typed.
    nonisolated private static func compact(_ value: String) -> String {
        value.uppercased().filter { $0.isLetter || $0.isNumber }
    }
}

// MARK: - Canonical separators

private extension Country {
    /// The number of trailing characters after the canonical separator in a normalized postcode,
    /// or `nil` if this country has no canonical separator (either because it has no postcode system,
    /// or because its postcode has no internal grouping, like France's `"75001"`).
    nonisolated var postcodeSuffixLength: Int? {
        switch self {
        case .gb, .ca, .br, .pt, .pl: return 3
        case .nl, .se: return 2
        case .us, .jp: return 4
        default: return nil
        }
    }

    nonisolated var postcodeSeparator: String {
        switch self {
        case .us, .pl, .jp, .pt, .br: return "-"
        default: return " "
        }
    }
}
