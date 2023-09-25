//
//  ProfileViewController.swift
//  Travel Journey
//
//  Created by Ruchira  on 26/09/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out",
                                                                    style: .done,
                                                                    target: self,
                                                                    action: #selector(didTapSignOut))
            }
            
            @objc private func didTapSignOut() {
                
            }
    }
