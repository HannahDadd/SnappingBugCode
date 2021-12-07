//
//  LargeForecastView.swift
//  SnappingBugCode
//
//  Created by Hannah Billingsley-Dadd on 06/12/2021.
//

import SwiftUI

struct LargeForecastView: View {
    let colour: Color
    let width: CGFloat

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 150, height: 150)
                        Spacer(minLength: 0).layoutPriority(-1)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("30°").font(.largeTitle)
                            Text("-2°").font(.title)
                            Circle()
                                .fill(Color.black)
                                .frame(width: 20, height: 20)
                        }
                    }
                    Spacer(minLength: 0)
                        .frame(minHeight: 0, idealHeight: 40, maxHeight: 40)
                        .layoutPriority(-1)
                    Text("Middle of the view").font(.largeTitle)
                }
                Spacer(minLength: 0)
                    .frame(minHeight: 8, idealHeight: 30, maxHeight: 30)
                    .layoutPriority(-0.5)
                HStack {
                    Text("Uv")
                    Text("Pollution")
                }.padding(.leading, 6)
                Spacer()
                    .layoutPriority(-1)
            }.padding()
        }.frame(minWidth: width, alignment: .leading)
    }
}
