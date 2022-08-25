//
//  Presenter.swift
//  MVPLesson
//
//  Created by Mikhail Ivanov on 25.08.2022.
//

import UIKit

protocol PresenterProtocol {
    func getNews()
}

final class Presenter {
    private weak var viewController: ViewControllerProtocol?
    private var model: ModelProtocol
    
    init(viewController: ViewControllerProtocol?,
         model: ModelProtocol = Model()) {
        self.model = model
        self.viewController = viewController
    }
}

extension Presenter: PresenterProtocol {
    func getNews() {
        model.getNews { [weak viewController] news in
            DispatchQueue.main.async {
                viewController?.updateNewsList(news)
            }
        }
    }
}
