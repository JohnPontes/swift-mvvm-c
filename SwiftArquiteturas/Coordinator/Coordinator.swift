//
//  Coordinator.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 15/01/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start()
    
    init(navigationController: UINavigationController)
}
