//
//  VisitDetailViewController.swift
//  Covid Track
//
//  Created by Samip shah on 28/7/20.
//  Copyright © 2020 Samip shah. All rights reserved.
//

import UIKit

class VisitDetailViewController: UIViewController {
  
  class func load()-> VisitDetailViewController {
    let vc: VisitDetailViewController = UIStoryboard(storyboard: .visit).instantiateViewController()
         return vc
  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
