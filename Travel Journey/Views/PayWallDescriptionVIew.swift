//
//  PayWallDescriptionVIew.swift
//  Travel Journey
//
//  Created by Ruchira  on 29/09/23.
//

import UIKit

class PayWallDescriptionVIew: UIView {

    private let descriptorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 0
        label.text = "Join Travel Journey Premium to read unlimited articles and browse thousands of posts"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .thin)
        label.numberOfLines = 1
        label.text = "₹99 / month"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        addSubview(priceLabel)
        addSubview(descriptorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        descriptorLabel.frame = CGRect(x: 20, y: 0, width: width-40, height: height/2)
        priceLabel.frame = CGRect(x: 20, y: height/2, width: width-40, height: height/2)
    }
}
