//
//  DeckListTableViewCell.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/19.
//

import UIKit

class DeckListTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var deckName: UILabel!
    @IBOutlet weak var view: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
