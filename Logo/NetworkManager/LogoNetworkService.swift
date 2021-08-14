//
//  LogoNetworkService.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import Foundation

protocol LogoNetworkServiceDelegate: AnyObject {
    func didSuccessfullyFetchData(data: [LogoData])
    func didFailedToFetchData(_ error: Error?)
}

class LogoNetworkService: NetworkManager {
    
    weak var delegate: LogoNetworkServiceDelegate?
    
    override init() {
        
    }
  
    func fetchLogoData() {
        request(path: .logo) { (logoData: [LogoData]) in
            self.delegate?.didSuccessfullyFetchData(data: logoData)
        } onFailure: { (error) in
            self.delegate?.didFailedToFetchData(error)
        }
    }
}
