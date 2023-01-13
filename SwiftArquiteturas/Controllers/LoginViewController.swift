//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 12/01/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registerButtonTap(_ sender: UIButton) {
        self.openRegisterView()
    }
    
    
    @IBAction func openButtonTap(_ sender: UIButton) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            manager.login(email: email, password: password) { userModel in
                self.openHomeView()
                
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error.localizedDescription)
            }
        }
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    private func openHomeView() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
       
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
    
    private func openRegisterView() {
        let registerView = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
       
        registerView.modalPresentationStyle = .fullScreen
        self.present(registerView, animated: true)
    }
    
    
    
}
