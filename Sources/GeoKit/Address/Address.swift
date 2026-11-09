// Address.swift
// GeoKit

/// A postal address, ready to be checked with `AddressValidator`.
public nonisolated struct Address: Sendable, Codable, Hashable {
    public var line1: String
    public var line2: String
    public var city: String
    public var postcode: String
    /// The ISO 3166-2 code of the address's subdivision, e.g. `"US-CA"`. Ignored if `country` has none.
    public var subdivisionCode: String
    public var country: Country

    public nonisolated init(
        line1: String = "",
        line2: String = "",
        city: String = "",
        postcode: String = "",
        subdivisionCode: String = "",
        country: Country
    ) {
        self.line1 = line1
        self.line2 = line2
        self.city = city
        self.postcode = postcode
        self.subdivisionCode = subdivisionCode
        self.country = country
    }
}

/// A reason an `Address` failed validation.
public nonisolated enum AddressValidationError: Error, Sendable, Equatable {
    case missingLine1
    case missingCity
    case missingPostcode
    case invalidPostcode
    case missingSubdivision
    case invalidSubdivision
}
