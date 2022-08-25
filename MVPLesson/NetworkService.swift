//
//  NetworkService.swift
//  MVPLesson
//
//  Created by Mikhail Ivanov on 25.08.2022.
//

import UIKit

protocol NetworkServiceProtocol {
    func getData<T: Decodable>(url: URL, completed: @escaping (T) -> Void)
    func getData<T: Decodable>(url: URL, completed: @escaping ([T]) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func getData<T: Decodable>(url: URL, completed: @escaping (T) -> Void) {
        getRequest(url: url) { data in
            guard let model = try? JSONDecoder().decode(T.self, from: data)
            else {
                fatalError("Error")
            }
            
            completed(model)
        }
    }
    
    func getData<T: Decodable>(url: URL, completed: @escaping ([T]) -> Void) {
        getRequest(url: url) { data in
            guard let model = try? JSONDecoder().decode([T].self, from: data)
            else {
                fatalError("Error")
            }
            
            completed(model)
        }
    }
}

private extension NetworkService {
    func getRequest(url: URL, completed: @escaping (Data) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                // ТАК НЕЛЬЗЯ В ПРОДЕ (!!!) ДЕЛАТЬ, НО ДЛЯ ПРИМЕРА =)
                fatalError(error.localizedDescription)
            }
            guard let data = data else {
                fatalError("Error")
            }
            completed(data)
        }
        task.resume()
    }
}
