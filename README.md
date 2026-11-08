# GeoKit

Country, currency, address, and phone number data and ISO validation rules for Swift.

## Requirements

- iOS 17+
- Swift 6.0
- Xcode 26+

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/yannbonafons/GeoKit", from: "1.0.0")
]
```

## Quick Start

### Country

```swift
let country = Country.fr
country.code                              // "FR"
country.alpha3                            // "FRA"
country.numericCode                       // "250"
country.flag                              // "🇫🇷"
country.localizedName                     // "France" (current locale)
country.localizedName(languageCode: "de") // "Frankreich"

Country(code: "fra")                      // .fr — lookup is case-insensitive, alpha-2 or alpha-3
```

### Currency

```swift
Country.fr.currencies                     // [Currency(code: "EUR", minorUnits: 2)]
Country.jp.currencies.first?.minorUnits   // 0 — yen has no subunit
let eur = Currency(code: "EUR", minorUnits: 2)
eur.symbol()                              // "€"
eur.localizedName(languageCode: "en")     // "Euro"
```

### Phone numbers

```swift
Country.fr.phoneRules.prefix                                 // "+33"
PhoneNumberValidator.country(from: "+33 6 12 34 56 78")       // .fr
PhoneNumberValidator.countries(from: "+1")                    // [.us, .ca, …]
PhoneNumberValidator.isValid("06 12 34 56 78", country: .fr)  // true
PhoneNumberValidator.placeholder(for: .fr)                    // "+33 6 12 34 56 78"

PhoneNumberFormatter.format("0612345678", country: .fr, as: .e164) // "+33612345678"
PhoneNumberFormatter.formatAsYouType("06123", country: .fr)        // "06 123"
```

### Address

```swift
Country.fr.addressRules.postcodePattern   // "\\d{5}"
Country.us.addressRules.subdivisions      // all 50 states + DC

AddressValidator.isValidPostcode("75001", country: .fr)      // true
AddressValidator.normalizedPostcode("sw1a1aa", country: .gb) // "SW1A 1AA"
AddressValidator.isValidSubdivision("CA", country: .us)      // true

let address = Address(line1: "1 rue de Rivoli", city: "Paris", postcode: "75001", country: .fr)
AddressValidator.validate(address)        // []
```

### SwiftUI

```swift
CountryPicker(selection: $country, showsDialCode: true)

TextField("Phone", text: $phoneNumber)
    .phoneNumberFormatting(text: $phoneNumber, country: country)
```

## Data coverage

- **Countries**: every ISO 3166-1 alpha-2 code, plus Kosovo (`XK`).
- **Currencies**: an ISO 4217 currency (or two, for a few countries) for every country with an economy.
- **Phone numbers**: validation, parsing, and formatting are backed by
  [PhoneNumberKit](https://github.com/PhoneNumberKit/PhoneNumberKit), so every country is covered.
- **Postcodes**: patterns for ~90 countries (see `Country+AddressData.swift`). Countries not listed
  have no enforced format and are treated as valid.
- **Subdivisions**: full ISO 3166-2 lists for the US, Canada, Australia, Mexico, Brazil, Italy, Spain,
  Japan, China, and India (see `Subdivisions+Data.swift`). Other countries have no subdivision list yet.
  Contributions adding more are welcome.

## Example App: GeoKitApp

Launch the Example app located into `Example/` folder for more explanation.

## License

MIT — see [LICENSE](LICENSE).
