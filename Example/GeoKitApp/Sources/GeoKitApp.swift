import SwiftUI
import GeoKit

@main
struct GeoKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var country: Country? = .fr
    @State private var phoneNumber = ""
    @State private var line1 = ""
    @State private var city = ""
    @State private var postcode = ""
    @State private var subdivisionCode = ""
    @State private var isPickingCountry = false

    private var selectedCountry: Country { country ?? .fr }

    var body: some View {
        NavigationStack {
            Form {
                countrySection
                phoneSection
                addressSection
            }
            .navigationTitle("GeoKit")
            .sheet(isPresented: $isPickingCountry) {
                NavigationStack {
                    CountryPicker(selection: $country,
                                  showsDialCode: false)
                        .navigationTitle("Country")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
            .onChange(of: country) { _, _ in
                phoneNumber = ""
                subdivisionCode = ""
            }
        }
    }

    private var countrySection: some View {
        Section("Country") {
            Button {
                isPickingCountry = true
            } label: {
                HStack {
                    Text(selectedCountry.flag)
                    Text(selectedCountry.localizedName)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.secondary)
                }
            }
            .buttonStyle(.plain)
        }
    }

    private var phoneSection: some View {
        Section("Phone") {
            TextField(PhoneNumberValidator.placeholder(for: selectedCountry), text: $phoneNumber)
                .keyboardType(.phonePad)
                .phoneNumberFormatting(text: $phoneNumber, country: selectedCountry)
            if !phoneNumber.isEmpty {
                let isValid = PhoneNumberValidator.isValid(phoneNumber, country: selectedCountry)
                validityLabel(isValid: isValid, validText: "Valid number", invalidText: "Invalid number")
            }
        }
    }

    private var addressSection: some View {
        Section("Address") {
            TextField("Address line 1", text: $line1)
            TextField("City", text: $city)
            TextField(selectedCountry.addressRules.postcodePlaceholder ?? "Postcode", text: $postcode)
                .textInputAutocapitalization(.characters)
            if !postcode.isEmpty {
                let isValid = AddressValidator.isValidPostcode(postcode, country: selectedCountry)
                validityLabel(isValid: isValid, validText: "Valid postcode", invalidText: "Invalid postcode")
            }
            if let subdivisionLabel = selectedCountry.addressRules.subdivisionLabel {
                Picker(subdivisionLabel.rawValue.capitalized, selection: $subdivisionCode) {
                    Text("None").tag("")
                    ForEach(selectedCountry.addressRules.subdivisions) { subdivision in
                        Text(subdivision.name).tag(subdivision.code)
                    }
                }
            }
        }
    }

    private func validityLabel(isValid: Bool, validText: String, invalidText: String) -> some View {
        Label(isValid ? validText : invalidText, systemImage: isValid ? "checkmark.circle.fill" : "xmark.circle.fill")
            .foregroundStyle(isValid ? .green : .red)
            .font(.footnote)
    }
}
