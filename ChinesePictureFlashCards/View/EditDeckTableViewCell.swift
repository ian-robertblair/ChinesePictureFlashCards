//
//  EditDeckTableViewCell.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/19.
//

import UIKit

class EditDeckTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var chineseWordLabel: UILabel!
    @IBOutlet weak var pronunciationLabel: UILabel!
    @IBOutlet weak var englishWordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

