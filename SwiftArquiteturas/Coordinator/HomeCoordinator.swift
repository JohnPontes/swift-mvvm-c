//
//  HomeCoordinator.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 16/01/23.
//

import Foundation
import UIKit


class HomeCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = HomeViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController.present(viewController, animated: true)
//        self.navigationController.pushViewController(viewController, animated: true)
        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
