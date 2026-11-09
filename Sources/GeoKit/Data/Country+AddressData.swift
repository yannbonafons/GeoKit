// Country+AddressData.swift
// GeoKit
//
// Postcode formats sourced from Google's libaddressinput reference data. Countries not listed
// below fall back to `AddressRules(postcodePattern: nil, postcodePlaceholder: nil,
// isPostcodeRequired: false)`, i.e. no format is enforced. Subdivision lists come from
// `Country.isoSubdivisions` (see Subdivisions+Data.swift).

public nonisolated extension Country {
    /// This country's address formatting and validation rules.
    nonisolated var addressRules: AddressRules {
        let info = Self.postcodeInfo[self]
        return AddressRules(
            postcodePattern: info?.pattern,
            postcodePlaceholder: info?.placeholder,
            isPostcodeRequired: info?.isRequired ?? false,
            subdivisionLabel: Country.subdivisionLabels[self],
            subdivisions: Country.isoSubdivisions[self] ?? []
        )
    }

    nonisolated private static let subdivisionLabels: [Country: SubdivisionLabel] = [
        .us: .state, .mx: .state, .br: .state, .`in`: .state, .au: .state,
        .ca: .province, .cn: .province,
        .it: .region, .es: .region,
        .jp: .prefecture
    ]

    /// Postcode pattern (matched against the compacted, uppercased postcode, see `AddressValidator`),
    /// an example placeholder, and whether a postcode is required, keyed by country.
    nonisolated private static let postcodeInfo: [Country: (pattern: String?, placeholder: String?, isRequired: Bool)] = [
        .us: ("\\d{5}(\\d{4})?", "90210", true),
        .ca: ("[A-Z]\\d[A-Z]\\d[A-Z]\\d", "K1A0B1", true),
        .gb: ("[A-Z]{1,2}\\d[A-Z\\d]?\\d[A-Z]{2}", "SW1A 1AA", true),
        .ie: ("[A-Z\\d]{7}", "D02 AF30", false),
        .fr: ("\\d{5}", "75001", true),
        .de: ("\\d{5}", "10115", true),
        .it: ("\\d{5}", "00100", true),
        .es: ("\\d{5}", "28001", true),
        .pt: ("\\d{7}", "1000-205", true),
        .nl: ("\\d{4}[A-Z]{2}", "1234 AB", true),
        .be: ("\\d{4}", "1000", true),
        .lu: ("\\d{4}", "1009", true),
        .ch: ("\\d{4}", "8001", true),
        .at: ("\\d{4}", "1010", true),
        .dk: ("\\d{4}", "1050", true),
        .se: ("\\d{5}", "111 22", true),
        .no: ("\\d{4}", "0150", true),
        .fi: ("\\d{5}", "00100", true),
        .is: ("\\d{3}", "101", true),
        .pl: ("\\d{5}", "00-001", true),
        .cz: ("\\d{5}", "110 00", true),
        .sk: ("\\d{5}", "811 01", true),
        .hu: ("\\d{4}", "1051", true),
        .ro: ("\\d{6}", "010011", true),
        .bg: ("\\d{4}", "1000", true),
        .gr: ("\\d{5}", "104 31", true),
        .hr: ("\\d{5}", "10000", true),
        .si: ("\\d{4}", "1000", true),
        .rs: ("\\d{5}", "11000", true),
        .ba: ("\\d{5}", "71000", true),
        .mk: ("\\d{4}", "1000", true),
        .al: ("\\d{4}", "1001", true),
        .me: ("\\d{5}", "81000", true),
        .lt: ("\\d{5}", "01100", true),
        .lv: ("\\d{4}", "LV-1010", true),
        .ee: ("\\d{5}", "10111", true),
        .ua: ("\\d{5}", "01001", true),
        .by: ("\\d{6}", "220000", true),
        .md: ("\\d{4}", "2001", true),
        .ru: ("\\d{6}", "101000", true),
        .tr: ("\\d{5}", "34000", true),
        .cy: ("\\d{4}", "1010", true),
        .mt: ("[A-Z]{3}\\d{4}", "VLT 1117", true),
        .au: ("\\d{4}", "2000", true),
        .nz: ("\\d{4}", "1010", true),
        .`in`: ("\\d{6}", "110001", true),
        .cn: ("\\d{6}", "100000", true),
        .jp: ("\\d{7}", "100-0001", true),
        .kr: ("\\d{5}", "03154", true),
        .sg: ("\\d{6}", "238823", true),
        .my: ("\\d{5}", "50000", true),
        .th: ("\\d{5}", "10100", true),
        .vn: ("\\d{6}", "100000", true),
        .ph: ("\\d{4}", "1000", true),
        .id: ("\\d{5}", "10110", true),
        .tw: ("\\d{3,6}", "100", false),
        .hk: (nil, nil, false),
        .mo: (nil, nil, false),
        .ae: (nil, nil, false),
        .sa: ("\\d{5}(\\d{4})?", "11564", false),
        .il: ("\\d{5,7}", "9414219", true),
        .eg: ("\\d{5}", "11511", true),
        .ma: ("\\d{5}", "10000", true),
        .dz: ("\\d{5}", "16000", true),
        .tn: ("\\d{4}", "1001", true),
        .ng: ("\\d{6}", "100001", false),
        .ke: ("\\d{5}", "00100", false),
        .za: ("\\d{4}", "0001", true),
        .gh: (nil, nil, false),
        .et: ("\\d{4}", "1000", false),
        .br: ("\\d{8}", "01310-100", true),
        .mx: ("\\d{5}", "01000", true),
        .ar: ("([A-Z]\\d{4}[A-Z]{3}|\\d{4})", "C1000AAA", true),
        .cl: ("\\d{7}", "8320000", false),
        .co: ("\\d{6}", "110111", true),
        .pe: ("\\d{5}", "15001", false),
        .uy: ("\\d{5}", "11000", true),
        .py: ("\\d{4}", "1209", false),
        .bo: (nil, nil, false),
        .ec: ("\\d{6}", "170150", true),
        .ve: ("\\d{4}", "1010", false),
        .cr: ("\\d{5}", "10101", true),
        .pa: ("\\d{4}", "0801", false),
        .gt: ("\\d{5}", "01001", false),
        .hn: ("\\d{5}", "11101", false),
        .sv: ("\\d{4}", "1101", false),
        .ni: ("\\d{5}", "11001", false),
        .`do`: ("\\d{5}", "10101", false),
        .jm: (nil, nil, false),
        .tt: (nil, nil, false),
        .cu: ("\\d{5}", "10400", false)
    ]
}
