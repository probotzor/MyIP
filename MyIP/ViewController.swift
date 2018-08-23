//
//  ViewController.swift
//  MyIP
//
//  Created by Milos Jakovljevic on 10/27/17.
//  Copyright © 2017 Milos Jakovljevic. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      /*  refreshlabel.layer.cornerRadius = 5
        refreshlabel.layer.borderWidth = 2
        refreshlabel.layer.borderColor = UIColor.white.cgColor
        refreshlabel.titleLabel?.minimumScaleFactor = 0.5
        refreshlabel.titleLabel?.adjustsFontSizeToFitWidth = true
        refreshlabel.titleLabel?.numberOfLines = 1 */
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg1")?.draw(in: self.view.bounds)
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        }
        
    override func viewDidAppear(_ animated: Bool) {
        fetchip()
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func fetchip() {
        Alamofire.request("https://api.ipify.org/?format=json").responseJSON { response in guard let data = response.data else {
            
            return
            }
            let json = JSON(data: data)
            print(json)
            let myip = json["ip"].stringValue
            print(myip)
            if myip != "" {
            self.iplabel.text = myip
            self.whatsiplabel.text = "My IP is:"
            } else {
                self.iplabel.text = "Unable to fetch ip!"
                self.whatsiplabel.text = "No internet access!"
            }
        }
    }
    @IBAction func refresh(_ sender: Any) {
        fetchip()
    }
    
    @IBOutlet weak var refreshlabel: UIButton!
    

    @IBOutlet weak var iplabel: UILabel!
    @IBOutlet weak var whatsiplabel: UILabel!
    
}

