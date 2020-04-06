//
//  ExchangeView.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 16.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import SwiftUI
import CryptoAppNetwork
import SwiftUINavigation

struct ExchangeView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    let item: ExchangeItem
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack{
                    Image(uiImage: self.imageLoader.dataIsValid ? self.imageLoader.data!.image() : UIImage(systemName: "coloncurrencysign.circle") ?? UIImage())
                    Spacer()
                }
                .padding(8)
                HStack {
                    Text(self.item.country ?? "")
                    Spacer()
                }
                HStack {
                    Text(String(self.item.yearEstablished ?? 0))
                    Spacer()
                }
                HStack {
                    Text(self.item.url ?? "")
                        .underline(true, color: .blue).onTapGesture {
                            guard let link = self.item.url,
                                let url = URL(string: link) else { return }
                            UIApplication.shared.open(url)
                    }
                    Spacer()
                }
                
                if self.item.description != nil && self.item.description != "" {
                    HStack{
                        Text(self.item.description!)
                            .lineLimit(2)
                        Spacer()
                        NavPushButton(destination: DescriptionView(title: item.name, description: item.description!)) {
                            Image(systemName: "info.circle")
                        }
                    }
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .navigationBarTitle(Text(item.name), displayMode: NavigationBarItem.TitleDisplayMode.inline)
            .navigationBarItems(leading: BackNavigationItem())
        }
    }
}

//struct ExchangeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExchangeView()
//    }
//}
