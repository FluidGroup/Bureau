//
//  CustomInputRootView.swift
//  BureauDemo
//
//  Created by muukii on 2019/10/01.
//  Copyright © 2019 muukii. All rights reserved.
//

import UIKit

import Bureau

final class CustomInputRootView: UIView {
  
  static func make() -> CustomInputRootView {
    
    return Bundle.main.loadNibNamed("CustomInputRootView", owner: nil, options: nil)!.first! as! CustomInputRootView
    
  }
  
  @IBOutlet weak var marginConstraint: NSLayoutConstraint!
  var context: BureauContext?

  @IBAction func tapShortButton(_ sender: Any) {
    UIView.animate(withDuration: 0.2) {
      self.marginConstraint.constant = 20
      self.layoutIfNeeded()
    }
  }
  
  @IBAction func tapMidButton(_ sender: Any) {
    UIView.animate(withDuration: 0.2) {
      self.marginConstraint.constant = 80
      self.layoutIfNeeded()
    }
  }
  
  @IBAction func tapTallButton(_ sender: Any) {
    UIView.animate(withDuration: 0.2) {
      self.marginConstraint.constant = 160
      self.layoutIfNeeded()
    }
  }
  
  @IBAction func tapDismissButton(_ sender: Any) {
    context?.dismiss()
  }
  
}

