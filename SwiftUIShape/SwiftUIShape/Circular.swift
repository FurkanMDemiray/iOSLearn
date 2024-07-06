//
//  Circular.swift
//  SwiftUIShape
//
//  Created by Melik Demiray on 3.01.2024.
//

import SwiftUI

struct Circular: View {

    let lineWidth: CGFloat
    let percent: Double
    let foregroundColor: Color
    let backgroundColor: Color

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CircularShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)

                CircularShape(percent: percent)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(foregroundColor)
            }.animation(.easeIn(duration: 1), value: percent)
                .padding(lineWidth / 1.2)
        }
    }
}

#Preview {
    Circular(lineWidth: 10, percent: 50, foregroundColor: .red, backgroundColor: .yellow)
}
