// AddressRules.swift
// GeoKit

/// The address formatting and validation rules for a country.
public struct AddressRules: Sendable {
    /// A regular expression matching a valid postcode once whitespace and hyphens are stripped, or `nil`
    /// if the country has no formal postcode system (e.g. the United Arab Emirates, Hong Kong).
    public let postcodePattern: String?

    /// An example postcode suitable for use as a text field placeholder, e.g. `"75001"` for France.
    public let postcodePlaceholder: String?

    /// Whether an address in this country must include a postcode.
    public let isPostcodeRequired: Bool

    /// The label used to present `subdivisions` to the user, or `nil` if the country has none.
    public let subdivisionLabel: SubdivisionLabel?

    /// The country's first-level subdivisions (states, provinces, regions, …), if GeoKit has them.
    public let subdivisions: [Subdivision]

    /// Whether an address in this country is expected to include one of `subdivisions`.
    public nonisolated var requiresSubdivision: Bool { !subdivisions.isEmpty }

    nonisolated init(
        postcodePattern: String?,
        postcodePlaceholder: String?,
        isPostcodeRequired: Bool,
        subdivisionLabel: SubdivisionLabel? = nil,
        subdivisions: [Subdivision] = []
    ) {
        self.postcodePattern = postcodePattern
        self.postcodePlaceholder = postcodePlaceholder
        self.isPostcodeRequired = isPostcodeRequired
        self.subdivisionLabel = subdivisionLabel
        self.subdivisions = subdivisions
    }
}
