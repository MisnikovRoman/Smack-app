//
//  ChannelCell.swift
//  Smack-app-udemy
//
//  Created by Роман Мисников on 27/07/2018.
//  Copyright © 2018 Роман Мисников. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var selectionBGView: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // edit selection background
        if selected {
            //self.layer.backgroundColor = UIColor(white: 1.0, alpha: 0.2).cgColor
            self.selectionBGView.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        } else {
            //self.layer.backgroundColor = UIColor.clear.cgColor
            self.selectionBGView.backgroundColor = .clear
        }
    }
    
    func setupCell(channel: Channel) {
        let title = channel.channelTitle
        nameLbl.text = "#" + title
    }
    
}
