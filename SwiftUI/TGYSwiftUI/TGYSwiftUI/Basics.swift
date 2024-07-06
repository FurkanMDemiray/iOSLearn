//
//  Basics.swift
//  TGYSwiftUI
//
//  Created by Melik Demiray on 29.04.2024.
//

import SwiftUI

struct Basics: View {
    var body: some View {
        Text("Hello, World! gjhhghjghjghjghjghjghjgghjghghjghg")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.green)
            .padding(.horizontal, 40)
            .underline()
            .multilineTextAlignment(.center)
            .background(Color.indigo)
            .clipShape(Capsule())
    }
}

#Preview {
    Basics()
        .preferredColorScheme(.dark)
}
