// PhoneFormat.swift
// GeoKit

import PhoneNumberKit

/// How a phone number should be displayed.
public nonisolated enum PhoneFormat: Sendable {
    /// `+33612345678`
    case e164
    /// `+33 6 12 34 56 78`
    case international
    /// `06 12 34 56 78`
    case national
}

extension PhoneFormat {
    var underlyingFormat: PhoneNumberFormat {
        switch self {
        case .e164: return .e164
        case .international: return .international
        case .national: return .national
        }
    }
}
