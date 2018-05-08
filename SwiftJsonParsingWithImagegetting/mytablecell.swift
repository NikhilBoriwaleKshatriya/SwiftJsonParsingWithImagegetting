//
//  mytablecell.swift
//  SwiftJsonParsingWithImagegetting
//
//  Created by nikhil boriwale on 5/8/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit

class mytablecell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lbltrackid: UILabel!
    @IBOutlet weak var lblcollectionCensoredName: UILabel!
    @IBOutlet weak var lblreleaseDate: UILabel!
    
    @IBOutlet weak var myiamge: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
