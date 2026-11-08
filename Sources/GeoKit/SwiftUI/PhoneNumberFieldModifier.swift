// PhoneNumberFieldModifier.swift
// GeoKit

import SwiftUI

/// Reformats a bound text value as a phone number while the user types.
private struct PhoneNumberFormattingModifier: ViewModifier {
    @Binding var text: String
    let country: Country

    func body(content: Content) -> some View {
        content
            .onChange(of: text) { _, newValue in
                let formatted = PhoneNumberFormatter.formatAsYouType(newValue, country: country)
                if formatted != text {
                    text = formatted
                }
            }
    }
}

public extension View {
    /// Formats `text` as a phone number for `country` as the user types, e.g. `"0612345678"` becomes
    /// `"06 12 34 56 78"` for France.
    func phoneNumberFormatting(text: Binding<String>, country: Country) -> some View {
        modifier(PhoneNumberFormattingModifier(text: text, country: country))
    }
}
