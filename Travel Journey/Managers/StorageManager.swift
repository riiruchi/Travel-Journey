//
//  StorageManager.swift
//  Travel Journey
//
//  Created by Ruchira  on 26/09/23.
//
import UIKit
import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    
    private let container = Storage.storage().reference()
    
    private init() {}
    
    public func uploadUserProfilePicture(
        email: String,
        image: UIImage?,
        completion: @escaping (Bool) -> Void) {
    }
    
    public func downloadUrlForProfilePicture(
        user: User,
        completion: @escaping (Bool) -> Void) {
        }
    
    public func uploadBlogHeaderImage(
        blogPost: BlogPost,
        image: UIImage?,
        completion: @escaping (Bool) -> Void) {
        }
    
    public func downloadUrlForPostHeader(
        blogPost: BlogPost,
        completion: @escaping (Bool) -> Void) {
        }
}

