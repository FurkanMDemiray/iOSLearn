//
//  ContentView.swift
//  StateManagement
//
//  Created by Melik Demiray on 7.01.2024.
//

import SwiftUI
import SwiftData

@Observable
class DarkTheme {
    var isEnabled: Bool = false
}

struct DarkChoiceView: View {

    @Bindable var darkTheme = DarkTheme()

    var body: some View {
        Toggle(isOn: $darkTheme.isEnabled) {
            Text("Dark Theme")
        }.fixedSize()
            .foregroundColor(darkTheme.isEnabled ? .white : .black)
    }
}


struct ContentView: View {

    // @State var counter = 0
    @State var darkTheme = DarkTheme()

    var body: some View {
        VStack {
            //AddButton(counter: $counter)
            //Text("Counter: \(counter)")
            DarkChoiceView(darkTheme: darkTheme)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(darkTheme.isEnabled ? Color.black : Color.white)
    }
}
/*
struct AddButton: View {
    @Binding var counter: Int

    var body: some View {
        Button(action: {
            self.counter += 1
        }) {
            Text("Add")
        }
    }
}
*/
#Preview {
    ContentView()
}




