//
//  DetailsView.swift
//  FavoriteBookSwiftUI
//
//  Created by Melik Demiray on 8.12.2023.
//

import SwiftUI

struct DetailsView: View {

    var chosenFavoriteElement: FavoriteElements

    var body: some View {
        VStack {
            Image(chosenFavoriteElement.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(chosenFavoriteElement.name)
                .padding()
            Text(chosenFavoriteElement.description)
                .padding()
                .font(.footnote)
        }
    }
}

#Preview {
    DetailsView(chosenFavoriteElement: theGodfather)
}
