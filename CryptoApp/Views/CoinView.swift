//
//  CoinView.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 14.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import SwiftUI

struct CoinView: View {
    let item: CoinItem
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack{
                    Text("Symbol: \(item.symbol)")
                    Spacer()
                }
                HStack{
                    Text("Id: \(item.id)")
                    Spacer()
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .navigationBarTitle(Text(item.name), displayMode: NavigationBarItem.TitleDisplayMode.inline)
            .navigationBarItems(leading: BackNavigationItem())
        }
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(item: CoinItem(id: "item", symbol: "item", name: "test"))
    }
}
