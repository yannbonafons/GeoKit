// Country+Info.swift
// GeoKit

import Foundation

// MARK: - Identity

public extension Country {
    /// The ISO 3166-1 alpha-2 code, e.g. `"FR"`.
    nonisolated var code: String { rawValue }

    /// Creates a country from its ISO 3166-1 alpha-2 or alpha-3 code.
    ///
    /// Lookup is case-insensitive, e.g. both `"fr"` and `"FRA"` resolve to `.fr`.
    nonisolated init?(code: String) {
        let normalized = code.uppercased()
        if let match = Country(rawValue: normalized) {
            self = match
            return
        }
        guard normalized.count == 3,
              let match = Country.allCases.first(where: { $0.alpha3 == normalized }) else {
            return nil
        }
        self = match
    }
}

// MARK: - Display

public extension Country {
    /// The country's flag, built from Unicode regional indicator symbols.
    nonisolated var flag: String {
        let base: UInt32 = 0x1F1E6
        let letterA: UInt32 = Unicode.Scalar("A").value
        let scalars = code.unicodeScalars.compactMap { scalar -> Unicode.Scalar? in
            Unicode.Scalar(base + (scalar.value - letterA))
        }
        return String(String.UnicodeScalarView(scalars))
    }

    /// The country's name localized for the given BCP 47 language code, e.g. `"fr"`.
    ///
    /// Falls back to the alpha-2 code if no localized name is available.
    nonisolated func localizedName(languageCode: String) -> String {
        Locale(identifier: languageCode).localizedString(forRegionCode: code) ?? code
    }

    /// The country's name localized for the current locale.
    nonisolated var localizedName: String {
        localizedName(languageCode: Locale.current.identifier)
    }
}
