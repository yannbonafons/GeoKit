// CountryTests.swift
// GeoKitTests

import Testing
@testable import GeoKit

@Suite("Country")
struct CountryTests {
    @Test("Every country has a unique alpha-2 code")
    func uniqueCodes() {
        let codes = Country.allCases.map(\.code)
        #expect(Set(codes).count == codes.count)
    }

    @Test("Every country has a unique alpha-3 code")
    func uniqueAlpha3Codes() {
        let codes = Country.allCases.map(\.alpha3)
        #expect(Set(codes).count == codes.count)
        #expect(codes.allSatisfy { $0.count == 3 })
    }

    @Test("Flags are built from two regional indicator scalars")
    func flag() {
        #expect(Country.fr.flag == "🇫🇷")
        #expect(Country.us.flag == "🇺🇸")
        #expect(Country.jp.flag == "🇯🇵")
    }

    @Test("Localized names resolve for a given language")
    func localizedName() {
        #expect(Country.de.localizedName(languageCode: "fr") == "Allemagne")
        #expect(Country.fr.localizedName(languageCode: "en") == "France")
    }

    @Test(
        "Lookup by code is case-insensitive and accepts alpha-2 or alpha-3",
        arguments: ["fr", "FR", "fra", "FRA"]
    )
    func initFromCode(_ code: String) {
        #expect(Country(code: code) == .fr)
    }

    @Test("Lookup fails for an unknown code")
    func initFromUnknownCode() {
        #expect(Country(code: "ZZ") == nil)
        #expect(Country(code: "ZZZ") == nil)
    }
}
