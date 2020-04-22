//
//  CoinsListView.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 13.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import SwiftUI
import CryptoAppNetwork
import SwiftUINavigation

struct CoinRow: View {
    
    let item: CoinData
    
    var body: some View {
        NavPushButton(destination: CoinView(item: item)) {
            VStack(alignment: .leading) {
                Text(self.item.name)
                    .font(.title)
                Text(self.item.symbol)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct CoinsListView: View {
    
    @EnvironmentObject var viewModel: CoinsListViewModel
    
    var body: some View {
        List(viewModel.items) { item in
            VStack(alignment: .leading) {
                CoinRow(item: item)
                    .onAppear() {
                        if self.viewModel.items.isLast(item) {
                            self.viewModel.fetchCoinsFromCache()
                        }
                }
            }
        }
        .onAppear() {
            self.viewModel.fetchCoinsFromCache()
        }
    }
}

struct CoinsListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsListView()
    }
}
