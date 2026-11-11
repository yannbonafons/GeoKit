// AddressTests.swift
// GeoKitTests

import Foundation
import Testing
@testable import GeoKit

@Suite("Address")
struct AddressTests {
    @Test(
        "Valid postcodes pass, regardless of how they're cased or spaced",
        arguments: [
            (Country.fr, "75001"),
            (Country.us, "90210"),
            (Country.us, "90210-1234"),
            (Country.gb, "SW1A 1AA"),
            (Country.gb, "sw1a1aa"),
            (Country.ca, "K1A 0B1"),
            (Country.ca, "k1a0b1"),
            (Country.nl, "1234 AB"),
            (Country.nl, "1234ab")
        ]
    )
    func validPostcodes(country: Country, postcode: String) {
        #expect(AddressValidator.isValidPostcode(postcode, country: country))
    }

    @Test(
        "Invalid postcodes fail",
        arguments: [
            (Country.fr, "ABCDE"),
            (Country.fr, "7500"),
            (Country.us, "9021"),
            (Country.gb, "12345"),
            (Country.ca, "12345")
        ]
    )
    func invalidPostcodes(country: Country, postcode: String) {
        #expect(!AddressValidator.isValidPostcode(postcode, country: country))
    }

    @Test("Countries with no postcode system accept anything, including an empty string")
    func noPostcodeSystem() {
        #expect(AddressValidator.isValidPostcode("", country: .ae))
        #expect(AddressValidator.isValidPostcode("anything", country: .ae))
    }

    @Test("An empty postcode is invalid where one is required")
    func missingRequiredPostcode() {
        #expect(!AddressValidator.isValidPostcode("", country: .fr))
    }

    @Test(
        "Postcodes normalize to their canonical, separated form",
        arguments: [
            (Country.gb, "sw1a1aa", "SW1A 1AA"),
            (Country.ca, "k1a0b1", "K1A 0B1"),
            (Country.nl, "1234ab", "1234 AB"),
            (Country.us, "901234567", "90123-4567"),
            (Country.jp, "1000001", "100-0001"),
            (Country.us, "90210", "90210"),
            (Country.ie, "d02af30", "D02 AF30"),
            (Country.cz, " 11000 ", "110 00"),
            (Country.fr, "75001", "75001")
        ]
    )
    func normalizedPostcode(country: Country, input: String, expected: String) {
        #expect(AddressValidator.normalizedPostcode(input, country: country) == expected)
    }

    @Test(
        "Subdivisions validate by full or short ISO 3166-2 code",
        arguments: ["US-CA", "us-ca", "CA", "ca"]
    )
    func validSubdivision(_ code: String) {
        #expect(AddressValidator.isValidSubdivision(code, country: .us))
    }

    @Test("An unknown subdivision fails for a country with a known list")
    func invalidSubdivision() {
        #expect(!AddressValidator.isValidSubdivision("US-ZZ", country: .us))
    }

    @Test("Countries with no known subdivision list accept anything")
    func noSubdivisionList() {
        #expect(AddressValidator.isValidSubdivision("anything", country: .fr))
    }

    @Test("Every postcode pattern GeoKit ships is a valid regular expression")
    func allPatternsCompile() {
        for country in Country.allCases {
            guard let pattern = country.addressRules.postcodePattern else { continue }
            #expect(
                (try? NSRegularExpression(pattern: pattern)) != nil,
                "\(country.code) has an invalid postcode pattern"
            )
        }
    }

    @Test("A complete, valid US address has no validation errors")
    func validAddress() {
        let address = Address(
            line1: "1600 Amphitheatre Parkway",
            city: "Mountain View",
            postcode: "94043",
            subdivisionCode: "US-CA",
            country: .us
        )
        #expect(AddressValidator.validate(address).isEmpty)
    }

    @Test("A bare-minimum address reports every missing required field")
    func incompleteAddress() {
        let errors = AddressValidator.validate(Address(country: .us))
        #expect(errors.contains(.missingLine1))
        #expect(errors.contains(.missingCity))
        #expect(errors.contains(.missingPostcode))
        #expect(errors.contains(.missingSubdivision))
    }

    @Test("An invalid postcode and subdivision are each reported")
    func invalidFields() {
        let address = Address(
            line1: "1 Main St",
            city: "Nowhere",
            postcode: "ABCDE",
            subdivisionCode: "US-ZZ",
            country: .us
        )
        let errors = AddressValidator.validate(address)
        #expect(errors.contains(.invalidPostcode))
        #expect(errors.contains(.invalidSubdivision))
    }
}
