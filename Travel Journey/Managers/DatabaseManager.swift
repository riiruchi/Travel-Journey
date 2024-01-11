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
                       email: String,
                       completion: @escaping (Bool) -> Void
    ) {
        let userEmail = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        let data: [String: Any] = [
            "id": blogPost.identifier,
            "title": blogPost.title,
            "body": blogPost.text,
            "created": blogPost.timeStamp,
            "headerImageUrl": blogPost.headerImageUrl?.absoluteString ?? ""
        ]
        
        database
            .collection("users")
            .document(userEmail)
            .collection("posts")
            .document(blogPost.identifier)
            .setData(data) { error in
                completion(error == nil)
            }
    }
    
    public func getAllPost(completion: @escaping (BlogPost) -> Void) {
        
    }
    
    public func getPosts(for email: String, completion: @escaping ([BlogPost]) -> Void) {
        let userEmail = email.replacingOccurrences(of: ".", with: "_")
                             .replacingOccurrences(of: "@", with: "_")
        database.collection("users")
                .document(userEmail)
                .collection("posts")
                .getDocuments { snapshot, error in
                    guard let documents = snapshot?.documents.compactMap({ $0.data() }), error == nil else {
                              return
                    }
                    print("no of document - \(documents.count)")
                    let posts: [BlogPost] = documents.compactMap({ dictionary in
                        guard let id = dictionary["id"] as? String,
                              let title = dictionary["title"] as? String,
                              let body = dictionary["body"] as? String,
                              let created = dictionary["created"] as? Double,
                              let imageUrlString = dictionary["headerImageUrl"] as? String else {
                            return nil
                        }
                             
                        
                        let post = BlogPost(identifier: id,
                                            title: title,
                                            timeStamp: created,
                                            headerImageUrl: URL(string: imageUrlString),
                                            text: body)
                        
                        return post
                        
                    })
                    completion(posts)
                }
    }
    
    public func insert(user: User,
                       completion: @escaping (Bool) -> Void
    ) {
        let documentId = user.email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        
        let data = [
            "email": user.email,
            "name": user.name
        ]
        
        database
            .collection("users")
            .document(documentId)
            .setData(data) {error in
                completion(error == nil)
            }
    }
    
    public func getUser(email: String, completion: @escaping (User?) -> Void) {
        
        let documentId = email
            .replacingOccurrences(of: ".", with: "_")
            .replacingOccurrences(of: "@", with: "_")
        
        database
            .collection("users")
            .document(documentId)
            .getDocument { snapshot, error in
                guard let data = snapshot?.data() as? [String: String],
                      let name = data["name"],
                      error == nil else {
                    return
                }
                
                
                var ref = data["profile_photo"]
                
                let user = User(name: name, email: email, profilePictureRef: ref)
                completion(user)
            }
    }
    
    func updateProfilePhoto(email:String, completion: @escaping (Bool) -> Void
    ){
        let path = email
            .replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_")
        
        let photoReference = "profile_pictures/\(path)/photo.png"
        
        let dbRef = database
            .collection("users")
            .document(path)
        
        dbRef.getDocument { snapshot, error in
            guard var data = snapshot?.data(), error == nil else{
                return
            }
            data["profile_photo"] = photoReference
            
            dbRef.setData(data) { error in
                completion(error == nil)
            }
        }
    }
}
