//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/4/21.
//

import FirebaseFirestore
import Foundation

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() {}
    
    let database = Firestore.firestore()
    
}
