//
//  User.swift
//  MyFavoriteApp
//
//  Created by Brooke Kumpunen on 3/20/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let name: String
    let favoriteApp: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case favoriteApp = "favApp"
    }
}
