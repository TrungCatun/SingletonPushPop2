//
//  ViewController.swift
//  SingletonPushPop2
//
//  Created by trung on 2018/08/21.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var outletTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        outletTextField.text = String(Singleton.inSingleton.array[Singleton.inSingleton.index])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

