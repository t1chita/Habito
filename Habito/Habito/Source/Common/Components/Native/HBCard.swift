//
//  HBCard.swift
//  Habito
//
//  Created by Temur Chitashvili on 05.11.24.
//


import SwiftUI

struct HBCard<Content: View>: View {
    let style: CardStyleType
    let content: Content

    init(style: CardStyleType, @ViewBuilder content: () -> Content) {
        self.style = style
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundView)  // Use a view instead of a color here
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style == .outline ? Color.gray : Color.clear, lineWidth: 1)
                )
                .shadow(radius: style == .filled ? 4 : 0)
        }
    }

    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .filled:
            Color.cardBackground
        case .outline:
            Color.clear
        case .gradient:
            LinearGradient(colors: [Color.accent, Color.accentColor1, Color.accentColor2, Color.accentColor3, Color.accentColor4], startPoint: .top, endPoint: .bottom)
        }
    }
}

