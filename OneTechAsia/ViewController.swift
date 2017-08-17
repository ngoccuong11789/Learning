//
//  ViewController.swift
//  OneTechAsia
//
//  Created by Rea Won Kim on 8/17/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Device_swift
class ViewController: UIViewController {

    @IBOutlet weak var scrollView : UIScrollView!
    
    @IBOutlet weak var topBackBtn: UIButton!
    @IBOutlet weak var widthTopBtnContraints: NSLayoutConstraint!
    let Width : CGFloat = 162
    let Heigh: CGFloat = 147
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        APIManager.sharedInstance.getAds("Busaiku", user_agent: "Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25", success: { (listAds) in
            //print(listAds.msg)
        }) { (error) in
            print(error.localizedDescription)
        }
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            print("Ipad")
            widthTopBtnContraints.constant = 200
            
            
        }
<<<<<<< HEAD
=======
        
>>>>>>> d625377169b0f387ccded81598745a134d55624c
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

