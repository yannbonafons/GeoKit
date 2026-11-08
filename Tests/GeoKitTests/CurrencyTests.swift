// CurrencyTests.swift
// GeoKitTests

import Testing
@testable import GeoKit

@Suite("Currency")
struct CurrencyTests {
    @Test("Countries resolve to their expected currency")
    func countryCurrency() {
        #expect(Country.fr.currencies.map(\.code) == ["EUR"])
        #expect(Country.jp.currencies.map(\.code) == ["JPY"])
        #expect(Country.us.currencies.map(\.code) == ["USD"])
        #expect(Country.pa.currencies.map(\.code) == ["PAB", "USD"])
    }

    @Test("Minor units reflect each currency's real-world decimal places")
    func minorUnits() {
        #expect(GeoCurrency(code: "EUR", minorUnits: 2).minorUnits == 2)
        #expect(Country.jp.currencies.first?.minorUnits == 0)
        #expect(Country.kw.currencies.first?.minorUnits == 3)
    }

    @Test("A currency with no economy resolves to an empty list")
    func noCurrency() {
        #expect(Country.aq.currencies.isEmpty)
    }

    @Test("Currency names localize")
    func localizedName() {
        #expect(GeoCurrency(code: "USD", minorUnits: 2).localizedName(languageCode: "en") == "US Dollar")
    }
}
