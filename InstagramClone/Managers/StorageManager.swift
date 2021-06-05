//
//  StorageManager.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/4/21.
//

import FirebaseStorage
import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    let storage = Storage.storage()
    
}
