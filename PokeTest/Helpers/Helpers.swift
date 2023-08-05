//
//  Helpers.swift
//  PokeTest
//
//  Created by Enrique Ramos on 19/1/23.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(url: URL, completion: @escaping (T) -> (), failure: @escaping (Error) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(error)
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData)
                } catch let decodeError {
                    failure(decodeError)
                }
            }
        }.resume()
    }
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion:@escaping(T) -> (), failure:@escaping(Error) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responde, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
    }
}
