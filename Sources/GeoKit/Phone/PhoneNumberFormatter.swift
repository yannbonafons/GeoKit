// PhoneNumberFormatter.swift
// GeoKit

import PhoneNumberKit

/// Formats phone numbers for display.
public enum PhoneNumberFormatter {
    /// Formats `number` as `format`, interpreting it in the context of `country`.
    ///
    /// Returns `nil` if `number` isn't a valid number for `country`.
    public static func format(_ number: String, country: Country, as format: PhoneFormat) -> String? {
        guard let parsed = try? PhoneNumberUtility.shared.parse(number, withRegion: country.code) else {
            return nil
        }
        return PhoneNumberUtility.shared.format(parsed, toType: format.underlyingFormat)
    }

    /// Formats `partial` the way a user would see it while typing, inserting spaces and punctuation
    /// as soon as enough digits are available. Never fails: an invalid or incomplete number is
    /// returned with as much formatting as could be applied.
    public static func formatAsYouType(_ partial: String, country: Country) -> String {
        let formatter = PartialFormatter(utility: PhoneNumberUtility.shared, defaultRegion: country.code)
        return formatter.formatPartial(partial)
    }
}
