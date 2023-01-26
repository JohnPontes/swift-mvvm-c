//
//  HomeViewController.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 18/01/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeView: HomeView = {
        let view = HomeView(frame: .zero)
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
