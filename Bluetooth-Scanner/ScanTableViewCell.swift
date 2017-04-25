//
//  ScanTableViewCell.swift
//  Bluetooth-Scanner
//
//  Created by admin on 10.04.17.
//  Copyright © 2017 DHBW. All rights reserved.
//

import UIKit

class ScanTableViewCell: UITableViewCell {
    
    @IBOutlet var LabelId: UILabel!
    @IBOutlet var LabelName: UILabel!
    @IBOutlet var LabelRSSI: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
