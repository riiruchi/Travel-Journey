//
//  IAPManager.swift
//  Travel Journey
//
//  Created by Ruchira  on 26/09/23.
//
import Foundation

final class IAPManager {
    static let shared = IAPManager()
    
    private var postEligibleViewDate: Date?
    
    private init() {}
    
    func isPremium() -> Bool {
        return UserDefaults.standard.bool(forKey: "premium")
    }
    
    public func getSubscriptionStatus(completion: ((Bool) -> Void)?) {
        UserDefaults.standard.set(true, forKey: "premium")
        completion?(true)
        return
    }
    
    public func subscribe(completion: @escaping (Bool) -> Void){
        UserDefaults.standard.set(true, forKey: "premium")
        completion(true)
    }
    
    public func restorePurchases(completion: @escaping (Bool) -> Void) {
        UserDefaults.standard.set(true, forKey: "premium")
        completion(true)
    }
}

extension IAPManager {
    var canViewPost: Bool {
        if isPremium() {
            return true
        }
        guard let date = postEligibleViewDate else {
            return true
        }
        UserDefaults.standard.set(0, forKey: "post_views")
        return Date() >= date
    }
    
    public func logPostViewed() {
        let total = UserDefaults.standard.integer(forKey: "post_views")
        UserDefaults.standard.set(total + 1, forKey: "post_views")
        
        if total == 2 {
            let hour: TimeInterval = 60 * 60
            postEligibleViewDate = Date().addingTimeInterval(hour * 24)
        }
    }
}
