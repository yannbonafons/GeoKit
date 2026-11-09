// Subdivision.swift
// GeoKit

/// A first-level country subdivision (state, province, region, …) identified by its ISO 3166-2 code.
public nonisolated struct Subdivision: Sendable, Codable, Hashable, Identifiable {
    /// The ISO 3166-2 code, e.g. `"US-CA"`.
    public let code: String

    /// The English name, e.g. `"California"`.
    public let name: String

    public nonisolated var id: String { code }

    /// The part of `code` after the country prefix, e.g. `"CA"` for `"US-CA"`.
    public nonisolated var shortCode: String {
        String(code.split(separator: "-", maxSplits: 1).last ?? Substring(code))
    }

    public nonisolated init(code: String, name: String) {
        self.code = code
        self.name = name
    }
}

/// The kind of label used to present a country's subdivisions, e.g. "State" for the US, "Prefecture" for Japan.
public nonisolated enum SubdivisionLabel: String, Sendable, Codable, CaseIterable {
    case state
    case province
    case region
    case prefecture
}
