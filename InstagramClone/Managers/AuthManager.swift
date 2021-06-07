//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/4/21.
//

import FirebaseAuth
import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    let auth = Auth.auth()
    
    enum AuthError: Error {
        case newUserCreation
    }
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    public func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
    }
    
    public func createAccount(email: String, username: String, profilePicture: Data?, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        let user = User(username: username, email: email)
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(.failure(AuthError.newUserCreation))
                return
            }
        }
        DatabaseManager.shared.createUser(user: user) {success in
            if success {
                StorageManager.shared.uploadProfilePicture(username: username, data: profilePicture) { uploadSuccess in
                    if uploadSuccess {
                        completion(.success(user))
                    } else {
                        completion(.failure(AuthError.newUserCreation))
                    }
                }
            } else {
                completion(.failure(AuthError.newUserCreation))
            }
        }
    }
    
    public func signOut(completion: @escaping (Bool) -> ()) {
        do {
            try auth.signOut()
            completion(true)
        } catch {
            print(error)
            completion(false)
        }
    }
}
