//
//  DatabaseManager.swift
//  Travel Journey
//
//  Created by Ruchira  on 26/09/23.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Firestore.firestore()
    
    private init() {}
    
    public func insert(blogPost: BlogPost,
                       user: User,
                       completion: @escaping (Bool) -> Void) {
        
    }
    
    public func getAllPost(completion: @escaping (BlogPost) -> Void) {
        
    }
     
    public func getPosts(for user: User,
                         completion: @escaping (String) -> Void) {
        
    }
    
    public func insert(user: User,
                       completion: @escaping (Bool) -> Void) {
        
    }
    
}
