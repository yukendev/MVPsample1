//
//  MusicTableViewCell.swift
//  MVPsample1
//
//  Created by 手塚友健 on 2021/04/28.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
