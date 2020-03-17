//
//  DescriptionView.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 17.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import SwiftUI

struct DescriptionView: View {
    
    let title: String
    let description: String
    var body: some View {
        NavigationView {
            VStack() {
                ScrollView{
                    Text(description)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .navigationBarTitle(Text(title), displayMode: NavigationBarItem.TitleDisplayMode.inline)
            .navigationBarItems(leading: BackNavigationItem(), trailing: HomeNavigationItem())
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(title: "title", description: "test")
    }
}
