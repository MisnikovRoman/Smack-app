//
//  avatarCell.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 16.04.2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // add BG color and rounded corners to our cells
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
