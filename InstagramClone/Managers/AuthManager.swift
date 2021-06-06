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
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    public func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
    }
    
    public func createAccount(email: String, username: String, profilePicture: Data?, password: String, completion: @escaping (Result<User, Error>) -> ()) {
    }
    
    public func signOut(completion: @escaping (Bool) -> ()) {
    }
}
