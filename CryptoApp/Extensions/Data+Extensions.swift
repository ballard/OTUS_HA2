//
//  Data+Extensions.swift
//  CryptoApp
//
//  Created by Иван Лазарев on 17.03.2020.
//  Copyright © 2020 Иван Лазарев. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    func image() -> UIImage {
        UIImage(data: self) ?? UIImage()
    }
}
