//
//  PayWallViewController.swift
//  Travel Journey
//
//  Created by Ruchira  on 27/09/23.
//

import UIKit

class PayWallViewController: UIViewController {

    
    private let header = PayWallHeaderView()
    
   // Pricing and Product Info
   // CTA Buttons
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Subscribe", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    } ()
    
    private let restoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Subscribe", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    } ()
    
   // Terms of Service
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Travel Journey Premium"
        view.addSubview(header)
        view.backgroundColor = .systemBackground
        setUpCloseButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        header.frame = CGRect(x: 0,
                              y: view.safeAreaInsets.top,
                              width: view.width,
                              height: view.height/3.2)
    }
    
    private func setUpCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                            target: self,
                                                            action: #selector(didTapClose))
    }

    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
}
