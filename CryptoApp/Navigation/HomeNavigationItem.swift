//
//  HomeNavigationItem.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 17.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import SwiftUI

struct HomeNavigationItem: View {
    var body: some View {
        HStack {
            NavPopButton(destination: .root) { Image(systemName: "house") }
            Spacer()
        }
    }
}

struct HomeNavigationItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationItem()
    }
}
