//
//  ViewController.swift
//  MVPLesson
//
//  Created by Mikhail Ivanov on 25.08.2022.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    func updateNewsList(_ news: [NewsModel])
}

final class ViewController: UIViewController {
    
    private var presenter: PresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Presenter(viewController: self)
        getNewsList()
    }
}

extension ViewController: ViewControllerProtocol {
    func updateNewsList(_ news: [NewsModel]) {
        print(news)
    }
}

private extension ViewController {
    func getNewsList() {
        presenter?.getNews()
    }
}
