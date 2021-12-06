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
