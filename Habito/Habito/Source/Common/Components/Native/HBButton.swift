//
//  HBButton.swift
//  Habito
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

struct HBButton: View {
    let title: String
    let icon: Image?
    let style: HBButtonStyleType
    let size: HBComponentSize
    let imageOnLeft: Bool
    let cornerRadius: CGFloat
    let textFont: Font
    let textWeight: Font.Weight
    let action: () -> Void

    init(title: String,
         icon: Image? = nil,
         imageOnLeft: Bool,
         style: HBButtonStyleType,
         size: HBComponentSize = .medium,
         cornerRadius: CGFloat,
         textFont: Font,
         textWeight: Font.Weight ,
         action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.size = size
        self.action = action
        self.imageOnLeft = imageOnLeft
        self.cornerRadius = cornerRadius
        self.textFont = textFont
        self.textWeight = textWeight
    }

    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon, imageOnLeft {
                    icon
                }
                
                Text(title)
                    .font(textFont)
                    .fontWeight(textWeight)
                
                if let icon = icon, !imageOnLeft {
                    icon
                }
            }
            .frame(maxWidth: .infinity)
            .padding(sizePadding)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .shadow(radius: style == .primary ? 4 : 0)
            .cornerRadius(cornerRadius)
        }
    }

    private var backgroundColor: Color {
        switch style {
        case .primary: return Color.myPrimary
        case .secondary: return Color.mySecondary
        case .destructive: return Color.error
        }
    }

    private var textColor: Color {
        style == .secondary ? Color.black : Color.white
    }

    private var sizePadding: EdgeInsets {
        switch size {
        case .small: return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .medium: return EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        case .large: return EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32)
        }
    }
}
