//
//  ContentView.swift
//  SnappingBugCode
//
//  Created by Hannah Billingsley-Dadd on 03/12/2021.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var translation: CGFloat = 0
    @State var currentIndex: Int = 0
    @State private var lastOffsetY: CGFloat = 0
    @State private var offsetY: CGFloat = 0

    let colours: [Color] = [Color.red, Color.green, Color.orange, Color.gray, Color.pink, Color.purple, Color.yellow, Color.white]

    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ForEach(colours, id: \.self) { colour in
                    VStack {
                        Spacer()
                        Text("Top of the view").font(.largeTitle).foregroundColor(colour)
                        Spacer()
                        ScrollView(.horizontal) {
                            HStack {
                                LargeForecastView(colour: colour, width: geo.size.width)
                                LargeForecastView(colour: colour, width: geo.size.width)
                                LargeForecastView(colour: colour, width: geo.size.width)
                            }
                        }
                        Spacer()
                        ScrollView(.horizontal) {
                            HStack(spacing: 2) {
                                ForEach(colours, id: \.self) { colourSquare in
                                    Rectangle()
                                        .fill(colourSquare)
                                        .frame(width: 100, height: 100)
                                }
                            }.accessibility(addTraits: .isHeader)
                        }
                    }.ambienceBackgroundImage()
                        .frame(width: geo.size.width, height: geo.size.height)
                }
            }.offset(y: -CGFloat(currentIndex) * geo.size.height)
            .offset(y: offsetY + lastOffsetY)
            .animation(.easeInOut, value: translation)
            .simultaneousGesture(DragGesture().onChanged { gesture in
                withAnimation(.spring()) {
                    offsetY = lastOffsetY + gesture.translation.height
                }
            }.onEnded { value in
                if value.translation.height < -50 {
                    currentIndex = min((currentIndex) + 1, colours.count - 1)
                }
                if value.translation.height > 50 {
                    currentIndex = max((currentIndex) - 1, 0)
                }
                lastOffsetY = 0
                offsetY = 0
            })
        }.edgesIgnoringSafeArea(.all)
            .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
