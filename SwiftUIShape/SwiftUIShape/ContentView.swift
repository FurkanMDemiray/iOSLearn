//
//  ContentView.swift
//  SwiftUIShape
//
//  Created by Melik Demiray on 3.01.2024.
//

import SwiftUI

struct ContentView: View {


    @State var firstPercent: Double = 0
    @State var secondPercent: Double = 0
    @State var thirdPercent: Double = 0

    var body: some View {
        ZStack {

            Circular(lineWidth: 40,
                percent: firstPercent,
                foregroundColor: Color.blue,
                backgroundColor: Color.blue.opacity(0.2))
                .padding(20)
                .frame(width: 400, height: 400, alignment: .center)
                .onTapGesture {
                if self.firstPercent == 0 {
                    self.firstPercent = 50
                } else {
                    self.firstPercent = 0
                }
            }
            Circular(lineWidth: 40,
                percent: secondPercent,
                foregroundColor: Color.green,
                backgroundColor: Color.green.opacity(0.2))
                .padding(20)
                .frame(width: 300, height: 300, alignment: .center)
                .onTapGesture {
                if self.secondPercent == 0 {
                    self.secondPercent = 75
                } else {
                    self.secondPercent = 0
                }
            }
            Circular(lineWidth: 40,
                percent: thirdPercent,
                foregroundColor: Color.red,
                backgroundColor: Color.red.opacity(0.2))
                .padding(20)
                .frame(width: 200, height: 200, alignment: .center)
                .onTapGesture {
                if self.thirdPercent == 0 {
                    self.thirdPercent = 100
                } else {
                    self.thirdPercent = 0
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
