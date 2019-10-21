//
// Copyright (c) 2019 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public final class BureauController {
  
  public var containerView: BureauInputContainerView {
    inputViewController.containerView
  }
  
  public var inputViewController: BureauInputViewController {
    responder._inputViewController
  }
  
  private let responder: DummyResponder = .init()
  public let context: BureauContext = .init()
  
  public init() {
    
    context.onReceive = { [weak self] action in
      guard let self = self else { return }
      
      switch action {
      case .dismiss:
        self.dismiss()
      }
      
    }
  }
  
  public func setOwner(viewController: UIViewController) {
    responder.setOwner(viewController: viewController)
  }
  
  public func show() {
    if responder.isFirstResponder {
      responder.reloadInputViews()
    }
    responder.becomeFirstResponder()
  }
  
  public func dismiss() {
    responder.resignFirstResponder()
  }
  
}

final class DummyResponder: UIView {
  
  init() {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let _inputViewController = BureauInputViewController()
  
  override var canBecomeFirstResponder: Bool {
    true
  }
  
  override var inputViewController: UIInputViewController? {
    _inputViewController
  }
  
  func setOwner(viewController: UIViewController) {
    viewController.view.addSubview(self)
  }
    
}
