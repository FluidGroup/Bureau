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

public final class BureauInputViewController: UIInputViewController {
  
  private let context: BureauContext

  public init() {
    
    let _context = BureauContext()
    
    self.context = _context

    super.init(nibName: nil, bundle: nil)
    
    context.onReceive = { [weak self] action in
      
      guard let self = self else { return }
      
      switch action {
      case .dismiss:
        self.dismissKeyboard()
      }
    }
  }
  
  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    view.translatesAutoresizingMaskIntoConstraints = false
    inputView!.allowsSelfSizing = true
      
  }

  public func setView(_ contentView: UIView) {

    view.subviews.forEach {
      $0.removeFromSuperview()
    }

    view.addSubview(contentView)

    contentView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: view.topAnchor),
      contentView.rightAnchor.constraint(equalTo: view.rightAnchor),
      contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      contentView.leftAnchor.constraint(equalTo: view.leftAnchor),
    ])
  }

  public func setViewController(_ viewController: UIViewController) {

    children.forEach {
      $0.removeFromParent()
      $0.view.removeFromSuperview()
    }

    addChild(viewController)
    setView(viewController.view)
    viewController.didMove(toParent: self)
  }

}
