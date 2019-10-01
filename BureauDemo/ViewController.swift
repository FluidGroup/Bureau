//
//  ViewController.swift
//  BureauDemo
//
//  Created by muukii on 2019/10/01.
//  Copyright © 2019 muukii. All rights reserved.
//

import UIKit

import Bureau

class ViewController: UIViewController {
  
  private let bureauController = BureauController()
  private var token: Any?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    bureauController.setOwner(viewController: self)
    
    let rootView = CustomInputRootView.make()
    rootView.context = bureauController.context
    
    bureauController.containerView.addSubviewToEdges(view: rootView)
    
    // Do any additional setup after loading the view.

    token = NotificationCenter.default.addObserver(forName: UIApplication.keyboardWillChangeFrameNotification, object: nil, queue: nil) { (notification) in
      print(notification)
    }
   
  }
  

  @IBAction func tapShowButton(_ sender: Any) {
    
    bureauController.show()
    
  }
  
}

