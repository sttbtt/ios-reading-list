//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Scott Bennett on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate: class {
    func toggleHasBeenRead(for cell: BookTableViewCell)
}
