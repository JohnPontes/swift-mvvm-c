//
//  UserViewModel.swift
//  SwiftArquiteturas
//
//  Created by John Pontes on 18/01/23.
//

import Foundation

class UserViewModel {
    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        model.email
    }
    
    func getUserFromApi(_ email: String, _ password: String, completion: @escaping (Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: email, password: password) { [weak self] userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { [weak self] error in
            completion(.failure(error))
        }
    }
    
    func setUserFromApi(_ email: String, _ password: String, completion: @escaping (Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: email, password: password) { [weak self] userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { [weak self] error in
            completion(.failure(error))
        }

    }
}
