//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 15/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Clousers
    var onRegisterTap:(() -> Void)?
    var onLoginSuccess:(() -> Void)?
    
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        
        view.onRegisterTap = {
            self.onRegisterTap?()
        }
        
        view.onLoginTap = {[weak self] email, password in
            self?.loginTap(email, password)
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    private func loginTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        
        userViewModel.getUserFromApi(email, password) { [weak self] result in
            switch result {
                
            case .success(_):
                self?.onLoginSuccess?()
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
