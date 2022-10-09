//
//  NetworkingProducts.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 06/10/2022.
//

import Foundation

import Combine

final class DLwithCombine: ObservableObject {
    @Published var results: Products? = nil
    @Published var selectedConversion = 1.0
    @Published var conversions: Currencies? = nil
    @Published var setCurr = 0
  
    
    
    init() {
      getProducts()
        getCurrencies()
  
        
    }

    func getCurrencies() {
        let url = "https://api.apilayer.com/fixer/latest?symbols=GBP%2CEUR%2CUSD&base=GBP"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("XfAs2UOPY0a1WnxUFbkQAq9FKalXcC9y", forHTTPHeaderField: "apikey")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(URLError.badServerResponse)
                }
                
                return data
            }
            .decode(type: Currencies.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("COMPLETION: \(completion)")
            } receiveValue: { [weak self](returnedProducts) in
             
                self?.conversions = returnedProducts
                print(returnedProducts)
    
             
                
            }
    }
    
    func getProducts() {
        guard let url = URL(string: "https://www.matchesfashion.com/womens/shop?format=json") else {
            return
        }
        // I've created a publisher.
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(URLError.badServerResponse)
                }
               
                return data
            }
            .decode(type: Products.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("COMPLETION: \(completion)")
            } receiveValue: { [weak self](returnedProducts) in
             
                self?.results = returnedProducts
                print(returnedProducts)
    
             
                
            }

        // I've explicitly subscribed on the background thread, but i'm aware dataTaskPublisher does this by default, so this is uneccessary.
    }
}
