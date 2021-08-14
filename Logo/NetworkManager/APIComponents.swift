//
//  APIComponents.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import Foundation

enum APIComponent {
    case logo
}

extension APIComponent {
    
    var jsonFile: String {
        switch self {
        case .logo:
            return "logo"
        }
    }
 
}
