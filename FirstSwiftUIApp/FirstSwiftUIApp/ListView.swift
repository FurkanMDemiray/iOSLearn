//
//  ListView.swift
//  FirstSwiftUIApp
//
//  Created by Melik Demiray on 7.12.2023.
//

import SwiftUI

struct ListView: View {
    
    let array = ["furkan","melik","demiray"]
    
    var body: some View {
        VStack{
            List(array, id: \.self) { item in
                Text(item)
            }
            
            
        }
    }
}

#Preview {
    ListView()
}
