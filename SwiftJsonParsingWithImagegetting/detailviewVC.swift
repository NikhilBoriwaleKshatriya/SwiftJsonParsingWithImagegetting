//
//  detailviewVC.swift
//  SwiftJsonParsingWithImagegetting
//
//  Created by nikhil boriwale on 5/8/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit
import Kingfisher

class detailviewVC: UIViewController {

    @IBOutlet weak var lblcountry: UILabel!
    @IBOutlet weak var lblcurrency: UILabel!
    @IBOutlet weak var lblcollectionExplicitness: UILabel!
    @IBOutlet weak var lblcollectionPrice: UILabel!
    @IBOutlet weak var imagedetail: UIImageView!
    @IBOutlet weak var lblartistName: UILabel!
    @IBOutlet weak var lbltrackcensoredName: UILabel!
    
    // 1 ya  2 key muze acces kena ho tb ye likha pdega ..
//    var strcountry :String?
//    var strcurrency :String?
//    var strcollectionExplicitness :String?
//    var strcollectionPrice :String?
//    var strimagedetail :String?
//    var strartistName :String?
//    var strtrackcensoredName:String?
    
    // complete object data pass krna ho to mai ye  crete krunga. : 31 line number
    
    var detailObject: jsonmodel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        passdatashown()
        
    }
    func passdatashown()  {
        lblcountry.text = detailObject?.country       //optional chaing
        lblcurrency.text = detailObject?.currency
        lblcollectionExplicitness.text = detailObject?.collectionExplicitness
        lblcollectionPrice.text = detailObject?.collectionPrice
        lblartistName.text = detailObject?.artistName
        lbltrackcensoredName.text = detailObject?.trackcensoredName
        // check value is nil or not using if let statment
     if  let data =  detailObject
     {
        imagedetail.kf.setImage(with: URL(string:data.artworkurl100))
        
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
