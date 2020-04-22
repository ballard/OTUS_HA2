//
//  ExchangesListView.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 16.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import SwiftUI
import CryptoAppNetwork
import SwiftUINavigation

struct ExchangeRow: View {
    
    let item: ExchangeData
    
    @ObservedObject var imageLoader: ImageLoader
    
    @EnvironmentObject var viewModel: ExchangesListViewModel
    
    var body: some View {
        NavPushButton(destination: ExchangeView(imageLoader: imageLoader, item: item)) {
            HStack {
                Image(uiImage: self.imageLoader.dataIsValid ? self.imageLoader.data!.image() : UIImage(systemName: "coloncurrencysign.circle") ?? UIImage())
                
                VStack(alignment: .leading) {
                    Text(self.item.name)
                        .font(.title)
                    Text(self.item.country ?? "")
                        .font(.callout)
                        .foregroundColor(.gray)
                    if self.viewModel.isPageLoading && self.viewModel.items.isLast(self.item) {
                        Divider()
                        Text("Loading...")
                            .padding(.vertical)
                    }
                }
                Spacer()
                if self.item.description != nil && self.item.description != "" {
                    Image(systemName: "info.circle")
                }
            }
            
        }
    }
    
//    private func imageFromData(_ data:Data) -> UIImage {
//        UIImage(data: data) ?? UIImage()
//    }
}

struct ExchangesListView: View {
    
    @EnvironmentObject var viewModel: ExchangesListViewModel
    
    var body: some View {
        List(viewModel.items) { item in
            VStack(alignment: .leading) {
                ExchangeRow(item: item, imageLoader: ImageLoader(urlString: item.image ?? ""))
                    .onAppear() {
                        if self.viewModel.items.isLast(item) {
                            self.viewModel.downloadExchanges()
                        }
                }
            }
        }
        .navigationBarTitle("Fruits")
        .onAppear() {
            print("loading page")
            self.viewModel.loadPage()
        }
    }
}

struct ExchangesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangesListView()
    }
}
