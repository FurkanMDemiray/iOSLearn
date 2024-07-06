//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Melik Demiray on 7.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var myName = "furkan"
    
    
    var body: some View {
        VStack {
            Image("Lisa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.4)
            
            Text(myName)
                .padding()
                .font(.title)
            Button(action: {
                self.myName = "asdasd"
            }, label: {
                Text("Button")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    
            })
            TextField("placeholder", text: $myName) // binding
                .padding()
                .font(.title2)
                
        }

    }
}

#Preview {
    ContentView()
}
