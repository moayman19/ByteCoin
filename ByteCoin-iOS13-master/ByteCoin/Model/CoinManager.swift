//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C89E43CE-8163-4A28-AB7A-F23712BE77BF"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchCoin(coinName:String){
        let urlString = "\(baseURL)/\(coinName)?apiKey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlStrig:String){
        if let url = URL(string: urlStrig){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data,response,error) in
                if error != nil{
                    print(error!)
                }
                if let safeData = data{
                    self.parseJSON(coinData: safeData)
                }
                
            }
            task.resume()
        }
    }
     func parseJSON(coinData:Data) {
     let decoder = JSONDecoder()
     do{
     let decodeedData = try decoder.decode(CoinData.self, from: coinData)
     print(decodeedData.rate)
     }catch{
     print(error)
     }
     
     }
    
}
