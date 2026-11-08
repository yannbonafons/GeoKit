// CountryPicker.swift
// GeoKit

import SwiftUI

/// A searchable list for picking a `Country`, showing each country's flag and localized name.
public struct CountryPicker: View {
    @Binding private var selection: Country?
    private let showsDialCode: Bool
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss

    /// - Parameters:
    ///   - selection: The selected country. Tapping a row sets this and dismisses the picker.
    ///   - showsDialCode: Whether to show each country's phone dial code (e.g. `"+33"`) alongside its name.
    public init(selection: Binding<Country?>, showsDialCode: Bool = false) {
        self._selection = selection
        self.showsDialCode = showsDialCode
    }

    public var body: some View {
        List(filteredCountries) { country in
            Button {
                selection = country
                dismiss()
            } label: {
                row(for: country)
            }
            .buttonStyle(.plain)
        }
        .searchable(text: $searchText)
    }

    private func row(for country: Country) -> some View {
        HStack {
            Text(country.flag)
            Text(country.localizedName)
            Spacer()
            if showsDialCode {
                Text(country.phoneRules.prefix)
                    .foregroundStyle(.secondary)
            }
            if selection == country {
                Image(systemName: "checkmark")
                    .foregroundStyle(.tint)
            }
        }
    }

    /// Every country sorted by its localized name, computed once per locale instead of on every
    /// body evaluation.
    private static let sortedCountries = Country.allCases.sorted { $0.localizedName < $1.localizedName }

    private var filteredCountries: [Country] {
        guard !searchText.isEmpty else {
            return CountryPicker.sortedCountries
        }
        return CountryPicker.sortedCountries.filter { $0.localizedName.localizedCaseInsensitiveContains(searchText) }
    }
}
