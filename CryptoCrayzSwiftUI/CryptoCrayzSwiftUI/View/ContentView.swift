//
//  ContentView.swift
//  CryptoCrayzSwiftUI
//
//  Created by Melik Demiray on 30.12.2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var cryptoListViewModel = CryptoListViewModel()

    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }


    var body: some View {
        NavigationView {

            List(cryptoListViewModel.cryptos, id: \.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text(crypto.price)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.black)
                }.padding(2)

            }.navigationTitle("CryptoCrayz")

        }.task {
            await self.cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }

        /*.onAppear() {
            self.cryptoListViewModel.downloadCryptos(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }*/
    }
}

#Preview {
    ContentView()
}
