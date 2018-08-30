//
//  ViewController.swift
//  Alamofire+Codeble_demo2
//
//  Created by takuyaOhmuro on 2018/08/30.
//  Copyright © 2018年 takuyaOhmuro. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    let API_URL = "https://www.simplifiedcoding.net/demos/marvel/"
    var heroes = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(API_URL).responseJSON { response in
            let json = response.data
            
            do {
                let decoder = JSONDecoder()
                
                self.heroes = try decoder.decode([Hero].self, from: json!)
                for hero in self.heroes{
                    print(hero.name!)
                    self.textView.text = hero.realname
                }
            }catch let err {
                print(err)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

