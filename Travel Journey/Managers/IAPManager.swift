//
//  IAPManager.swift
//  Travel Journey
//
//  Created by Ruchira  on 26/09/23.
//
import Foundation

final class IAPManager {
    static let shared = IAPManager()
    
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
