//
//  RecipeTableViewCell.swift
//  fling
//
//  Created by woowabrothers on 2017. 8. 10..
//  Copyright © 2017년 osgd. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBAction func didToggleCheckboxButton(_ sender: CheckboxButton) {
        let state = sender.on ? "ON" : "OFF"
        print("checkbox button : \(state)")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
