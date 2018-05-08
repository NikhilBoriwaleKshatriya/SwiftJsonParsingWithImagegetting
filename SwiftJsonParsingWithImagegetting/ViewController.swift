//
//  ViewController.swift
//  SwiftJsonParsingWithImagegetting
//
//  Created by nikhil boriwale on 5/8/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher


class ViewController: UIViewController {
    @IBOutlet weak var mytable: UITableView!
    var arrData = [jsonmodel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swiftjson()
    }
    func swiftjson(){
        let url = URL(string:"https://itunes.apple.com/search?media=music&term=bollywood")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else{return}
            do{
               let json = try JSON (data:data)
                print(json)    // fetching hole data  from server
                let resultsKey = json["results"]  // array of dic
                print(resultsKey)
                for arr in resultsKey.arrayValue{     // multiple value asel using for loop u can collect
                //    let tracknamekey = arr["trackPrice"]    // normal way
                //    print(tracknamekey)
                    
                    //Using model class :
                    self.arrData.append(jsonmodel(json: arr))
                    
                    
                }
                print(self.arrData)
                DispatchQueue.main.async {
                    self.mytable.reloadData()
                }
                
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
   
    }
    

}

extension ViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell : mytablecell = tableView.dequeueReusableCell(withIdentifier: "mytablecell") as! mytablecell
        tablecell.lblname.text = arrData[indexPath.row].artistName
        tablecell.lbltrackid.text = arrData[indexPath.row].artistId
        tablecell.lblcollectionCensoredName.text = arrData[indexPath.row].collectionCensoredName
        tablecell.lblreleaseDate.text = arrData[indexPath.row].releaseDate
   //image load krnya  sathi server vrun string into Url convert kavi lagel
    tablecell.myiamge.kf.setImage(with: URL(string:arrData[indexPath.row].artworkurl100))
   
        return tablecell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let passdata : detailviewVC = self.storyboard?.instantiateViewController(withIdentifier: "detailviewVC") as! detailviewVC
        
        // agr muze 1 ya 2 key age ismay pass krna ho to may  aisa krunga : refer commecnt part
        
//        passdata.strartistName = arrData[indexPath.row].artistName
//        passdata.strcollectionExplicitness = arrData[indexPath.row].collectionExplicitness
//        passdata.strcollectionPrice = arrData[indexPath.row].collectionPrice
//        passdata.strcurrency = arrData[indexPath.row].currency
//        passdata.strcountry = arrData[indexPath.row].country
//       passdata.strimagedetail = arrData[indexPath.row].artworkurl100
        
        // Agr muze pura object ka model detail view may pass krna ho to may iss way say krunga :
        
        passdata.detailObject = arrData[indexPath.row]
      
        
        
        
        self.navigationController?.pushViewController(passdata, animated: true)
    }
    
    // agr suppose apka text proper set nahi ho rha hey to  label in Line ki value 0  kr na aur "UITableViewAutomaticDimension" set kr dena  Bottom cntainr set krke constraint
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    
}

