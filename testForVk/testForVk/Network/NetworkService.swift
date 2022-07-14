//
//  NetworkService.swift
//  testForVk
//
//  Created by Dmitry Kaveshnikov on 13/7/22.
//

import Foundation
import UIKit



class NetworkService {
    
    private init() { }
    private let path = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
    static let shared = NetworkService()
    
   func loadJson(completion: @escaping (Result<NResponseRootModel, Error>) -> Void) {
        if let url = URL(string: path) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(NResponseRootModel.self, from: data)
                        print(decodedData)
//                        let description = decodedData.body.services
//                        let imageURL = decodedData
                        
//                        let weather = WeatherModel(conditionID: id, cityName: name, temprature: temp)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            urlSession.resume()
        }
    }
    
    func loadImage() {
        
    }
    

    
    
    
    
}
