//
//  AmbientBackgroundView.swift
//  SnappingBugCode
//
//  Created by Hannah Billingsley-Dadd on 06/12/2021.
//

import SwiftUI

struct AmbienceBackgroundImage: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        Image(decorative: "1_cw")
            .resizable()
            .scaledToFill()
    }
}

private struct AmbienceImageBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(AmbienceBackgroundImage(), alignment: .bottomLeading)
            .clipped()
//            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func ambienceBackgroundImage() -> some View {
        self.modifier(AmbienceImageBackgroundModifier())
    }
}
