// Currency.swift
// GeoKit

import Foundation

/// An ISO 4217 currency.
public nonisolated struct GeoCurrency: Sendable, Codable, Hashable, Identifiable {
    /// The ISO 4217 alphabetic code, e.g. `"EUR"`.
    public let code: String

    /// The number of digits after the decimal separator, e.g. `2` for EUR, `0` for JPY, `3` for KWD.
    public let minorUnits: Int

    public nonisolated var id: String { code }

    /// Creates a currency from its ISO 4217 alphabetic code.
    public nonisolated init(code: String, minorUnits: Int) {
        self.code = code
        self.minorUnits = minorUnits
    }

    /// The currency symbol for a given locale, e.g. `"€"` or `"$"`.
    ///
    /// Falls back to the currency code if Foundation has no symbol for it.
    public nonisolated func symbol(locale: Locale = .current) -> String {
        var components = Locale.Components(locale: locale)
        components.currency = Locale.Currency(code)
        return Locale(components: components).currencySymbol ?? code
    }

    /// The currency's name localized for the given BCP 47 language code, e.g. `"fr"`.
    public nonisolated func localizedName(languageCode: String) -> String {
        Locale(identifier: languageCode).localizedString(forCurrencyCode: code) ?? code
    }
}
