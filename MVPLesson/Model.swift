//
//  Model.swift
//  MVPLesson
//
//  Created by Mikhail Ivanov on 25.08.2022.
//

import UIKit

protocol ModelProtocol {
    func getNews(completed: @escaping ([NewsModel]) -> Void)
}

final class Model {
    private var network: NetworkServiceProtocol
    
    init(network: NetworkServiceProtocol = NetworkService()) {
        self.network = network
    }
}

extension Model: ModelProtocol {
    func getNews(completed: @escaping ([NewsModel]) -> Void) {
        guard let url = URL(string: "pepe.com") else { return }
        network.getData(url: url, completed: completed)
    }
}
