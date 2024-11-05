//
//  HBText.swift
//  Habito
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

struct HBText: View {
    let text: String
    let style: TextStyleType
    let size: HBComponentSize
    var font: Font? = nil // Allow optional font
    var textColor: Color? = nil // Allow optional text color
    var padding: EdgeInsets? = nil // Allow optional padding
    var multiLineAlignment: TextAlignment

    var body: some View {
        Text(text)
            .font(font ?? defaultFont) // Use custom font if provided, otherwise use default
            .foregroundColor(textColor ?? defaultTextColor) // Use custom color if provided, otherwise use default
            .padding(padding ?? defaultPadding) // Use custom padding if provided, otherwise use default
            .multilineTextAlignment(multiLineAlignment)
    }

    private var defaultFont: Font {
        switch (style, size) {
        case (.title, _): return .largeTitle
        case (.subtitle, .small): return .subheadline
        case (.subtitle, _): return .headline
        case (.body, .small): return .footnote
        case (.body, .medium): return .body
        case (.body, .large): return .title
        }
    }

    private var defaultTextColor: Color {
        switch style {
        case .title: return Color.primaryText
        case .subtitle: return Color.secondaryText
        case .body: return Color.tertiaryText
        }
    }

    private var defaultPadding: EdgeInsets {
        switch size {
        case .small: return EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        case .medium: return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .large: return EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        }
    }
}

