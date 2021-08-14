//
//  NetworkManager.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import Foundation


class NetworkManager {
    let session = URLSession.shared

    func request<T: Codable>(path: APIComponent, onSuccess: @escaping (T)->Void, onFailure: @escaping (Error) ->Void ) {

        guard let filepath = Bundle.main.path(forResource: path.jsonFile, ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filepath), options: .mappedIfSafe)

            if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                
                onSuccess(responseObject)
            } else {
                onFailure(NSError(domain: "DECODING_ERROR", code: 12, userInfo: nil))
            }
            
        } catch {
            // handle error
            onFailure(error)
        }
    }
    
}


