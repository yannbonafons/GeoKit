// PhoneTests.swift
// GeoKitTests

import Testing
@testable import GeoKit

@Suite("Phone")
struct PhoneTests {
    @Test(
        "A dial code resolves to its main country",
        arguments: [("+33", Country.fr), ("+44", .gb), ("+1", .us), ("+49", .de)]
    )
    func countryFromDialCode(input: String, expected: Country) {
        #expect(PhoneNumberValidator.country(from: input) == expected)
    }

    @Test("A shared dial code resolves to every country that uses it")
    func countriesFromSharedDialCode() {
        let countries = PhoneNumberValidator.countries(from: "+1")
        #expect(countries.contains(.us))
        #expect(countries.contains(.ca))
    }

    @Test("Text with no digits resolves to no country")
    func countryFromNonNumericInput() {
        #expect(PhoneNumberValidator.country(from: "not a number") == nil)
    }

    @Test(
        "Known-valid numbers pass validation",
        arguments: [
            (Country.fr, "+33689555555"),
            (Country.fr, "0689555555"),
            (Country.us, "+16307792428"),
            (Country.gb, "+447739555555"),
            (Country.gb, "07739555555"),
            (Country.de, "491713369876")
        ]
    )
    func validNumbers(country: Country, number: String) {
        #expect(PhoneNumberValidator.isValid(number, country: country))
    }

    @Test("An implausible number fails validation")
    func invalidNumber() {
        #expect(!PhoneNumberValidator.isValid("123", country: .fr))
    }

    @Test("Validation also accepts a country code string")
    func validatesByCountryCode() {
        #expect(PhoneNumberValidator.isValid("0689555555", countryCode: "FR"))
        #expect(!PhoneNumberValidator.isValid("0689555555", countryCode: "ZZ"))
    }

    @Test(
        "Every country has a non-empty, prefixed placeholder",
        arguments: [Country.fr, .us, .gb, .de, .jp, .`in`, .br, .xk, .va]
    )
    func placeholderIsPrefixed(country: Country) {
        let placeholder = PhoneNumberValidator.placeholder(for: country)
        #expect(!placeholder.isEmpty)
        #expect(placeholder.hasPrefix(country.phoneRules.prefix))
    }

    @Test("A placeholder is also available by country code string")
    func placeholderByCountryCode() {
        #expect(PhoneNumberValidator.placeholder(forCountryCode: "FR") != nil)
        #expect(PhoneNumberValidator.placeholder(forCountryCode: "ZZ") == nil)
    }

    @Test("France's dial code and prefix are correct")
    func phoneRules() {
        let rules = Country.fr.phoneRules
        #expect(rules.dialCode == 33)
        #expect(rules.prefix == "+33")
    }

    @Test("Formatting a valid number as E.164 produces a dial-code-prefixed, space-free string")
    func formatAsE164() {
        #expect(PhoneNumberFormatter.format("0689555555", country: .fr, as: .e164) == "+33689555555")
    }

    @Test("Formatting an invalid number returns nil")
    func formatInvalidNumber() {
        #expect(PhoneNumberFormatter.format("not a number", country: .fr, as: .e164) == nil)
    }

    @Test("As-you-type formatting matches the final national format once the number is complete")
    func formatAsYouTypeMatchesNationalFormat() {
        let formatted = PhoneNumberFormatter.formatAsYouType("0689555555", country: .fr)
        let national = PhoneNumberFormatter.format("0689555555", country: .fr, as: .national)
        #expect(formatted == national)
    }
}
