//
//  LogoData.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import Foundation

class LogoData: Codable {
    var logoImage: String = ""
    var logoName: String
    
    enum CodingKeys: String, CodingKey {
        case logoImage = "imgUrl"
        case logoName = "name"
    }
    
    init( logoImage: String, logoName: String) {
        self.logoName = logoName
        self.logoImage = logoImage
    }
}
