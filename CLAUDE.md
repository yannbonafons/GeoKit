# GeoKit

The aim of this package is to handle country, currency, address, phone number and apply all ISO validation rules

## Project structure

```
Sources/GeoKit/
    Country/                # The `Country` enum and its identity/display accessors
    Data/                   # Static ISO data tables (alpha-3/numeric, currency, address, subdivisions)
    Phone/                  # PhoneRules, PhoneNumberValidator, PhoneNumberFormatter (backed by PhoneNumberKit)
    Address/                # Address, AddressRules, Subdivision, AddressValidator
    Currency/               # Currency
    SwiftUI/                # CountryPicker, phoneNumberFormatting(text:country:) ViewModifier
Tests/GeoKitTests/          # Unit tests (Swift Testing)
Example/GeoKitApp/          # Demo app (Xcode project via project.yml)
```

## Stack

- Swift 6, strict concurrency (`actor`, `Sendable`)
- SPM (swift-tools-version: 6.2)
- Minimum deployment: iOS 17
- Testing framework: Swift Testing (`import Testing`)
- Approachable concurrency: YES
- Default actor isolation: MainActor
- Strict concurrency checking: Complete
- SwiftLint via SPM build tool plugin
- [PhoneNumberKit](https://github.com/PhoneNumberKit/PhoneNumberKit) for phone number parsing,
  validation, and formatting — GeoKit doesn't duplicate phone numbering-plan data itself

### Data table conventions

- Country/currency/address/subdivision data lives in Swift dictionaries under `Sources/GeoKit/Data/`,
  not JSON resources — the compiler checks the data and nothing is decoded at runtime.
- Pure data types (`Country`, `Address`, `AddressValidationError`, `AddressRules`, `Subdivision`,
  `SubdivisionLabel`, `GeoCurrency`, `PhoneRules`, `PhoneFormat`, `AddressValidator`) and the
  `Country` data extensions are marked `nonisolated` at the type/extension level, so they and their
  conformances (`Codable`, `Hashable`…) can be used off the main actor, since the module's default
  actor isolation is `MainActor`. Mark any new pure data type `nonisolated` too. Phone APIs
  (`PhoneNumberFormatter`, `PhoneNumberValidator`, `Country.phoneRules`) and SwiftUI stay
  MainActor-isolated because `PhoneNumberUtility` is a shared, non-`Sendable` class.
- Postcode patterns in `Country+AddressData.swift` match a *compacted* postcode (uppercased, with
  whitespace and hyphens stripped) — see `AddressValidator.compact`.
- Not every country has postcode or subdivision data yet; a country not listed in
  `Country+AddressData.swift`'s `postcodeInfo` or `Subdivisions+Data.swift`'s `isoSubdivisions`
  simply has no enforced format. Contributions adding more countries are welcome.

## Rules

After any implementation, update the CLAUDE.md et README.md if needed


### Access Control Convention

- `public` only on types/members that the consumer module needs

## Code Style

- **4-space indentation**
- **PascalCase** for types, **camelCase** for properties/methods
- **@Observable** classes (only use Combine when @Observable is not enough)
- **Swift concurrency** (async/await) over Combine
- **Swift Testing** for unit tests (not XCTest)
- No force unwrapping
- Prefer `let` over `var`
- `public` only where necessary for cross-module access
- ViewModifiers exposed via View extensions (ViewModifier is private)
- MARK: comments to organize file sections
- Doc comments (`///`) on public API
