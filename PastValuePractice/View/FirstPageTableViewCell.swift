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
    
    
    @IBAction func deletePressed(_ sender: Any) {
        
        // 以 delegate 方式實作刪除 cell
        self.delegate?.userDidPressedDelete(self)
        
        selectedCell?(self)
    }
    
    // 以 closure 方式實作刪除 cell
    var selectedCell: ((FirstPageTableViewCell) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        deleteBtn.layer.borderWidth = 1
        
        deleteBtn.layer.borderColor = UIColor(red: 148/255, green: 17/255, blue: 0/255, alpha: 1).cgColor
        
        deleteBtn.layer.cornerRadius = 5
        
        deleteBtn.clipsToBounds = true
        
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
