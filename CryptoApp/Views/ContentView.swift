//
//  ContentView.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 13.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import SwiftUI
import CryptoAppNetwork
import SwiftUINavigation

struct ContentView: View {
    
    @State private var selectorIndex = 0
    @State private var numbers = ["Coins","Exchanges"]
    
    private var title: Text {
        return Text(numbers[selectorIndex].stringValue)
    }
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFadeIn, .moveAndFafeOut)) {
            NavigationView {
                VStack {
                    Picker("Sections", selection: self.$selectorIndex) {
                        ForEach(0..<self.numbers.count) { index in
                            Text(self.numbers[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    if self.selectorIndex == 0 {
                        CoinsListView()
                    } else {
                        ExchangesListView()
                    }
                }
                .navigationBarTitle(self.title, displayMode: NavigationBarItem.TitleDisplayMode.inline)
                // TODO: - make filter
                .navigationBarItems(trailing: Image(systemName: "magnifyingglass"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
