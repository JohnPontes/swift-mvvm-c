//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 16/01/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    //MARK: Clouser
    var onRegisterSuccess:(() -> Void)?
    
    //MARK: Properts
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onRegisterTap = {[weak self] email, password in
            self?.registerTap(email, password)
            
        }
        
        return view
    }()
    
    //MARK: override
    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Registro"
    }
    
    //MARK: Actions
    private func registerTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.setUserFromApi(email, password) { [weak self] result in
            switch result {
                
            case .success(_):
                self?.onRegisterSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
