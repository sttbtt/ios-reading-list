//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Scott Bennett on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    weak var delegate: BookTableViewCellDelegate?

    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var hasBeenReadButton: UIButton!
    
   
    func updateViews() {
        guard let book = book else { return }
        bookTitleLabel.text = book.title
        if book.hasBeenRead {
            hasBeenReadButton.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            hasBeenReadButton.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }
    

    @IBAction func readToggleButton(_ sender: Any) {
            delegate?.toggleHasBeenRead(for: self)
    }
    
}
