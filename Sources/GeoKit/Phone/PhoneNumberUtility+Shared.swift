// PhoneNumberUtility+Shared.swift
// GeoKit

import PhoneNumberKit

// `PhoneNumberUtility` loads and parses metadata for every country on first use, so GeoKit keeps a
// single shared instance instead of creating one per call.
extension PhoneNumberUtility {
    static let shared = PhoneNumberUtility()
}
