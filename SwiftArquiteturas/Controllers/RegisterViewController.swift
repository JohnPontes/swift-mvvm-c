//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 12/01/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openButtonTap(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func registerButtonTap(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            if password != confirmPassword {
                showMessage(title: "Erro", message: "Senhas não conferem")
                return
            }
            
            let manager = UserManager(business: UserBusiness())
            
            manager.register(email: email, password: password) { userModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error.localizedDescription)
            }

        }
    }
    
    private func openHomeView() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
       
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
    
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}
