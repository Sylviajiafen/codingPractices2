//
//  FirstPageTableViewCell.swift
//  PastValuePractice
//
//  Created by Sylvia Jia Fen  on 2019/8/20.
//  Copyright © 2019 Sylvia Jia Fen . All rights reserved.
//

import UIKit

class FirstPageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var stringLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    weak var delegate: FirstPageTableViewCellDelegate?
    
    // 以 delegate 方式實作刪除 cell
    @IBAction func deletePressed(_ sender: Any) {
        
        self.delegate?.userDidPressedDelete(self)
        
        selectedCell?(self)
    }
    
    // 以 closure 方式實作刪除 cell
    var selectedCell: ((FirstPageTableViewCell) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol FirstPageTableViewCellDelegate: AnyObject {
    
    func userDidPressedDelete(_ cell: FirstPageTableViewCell)
}
