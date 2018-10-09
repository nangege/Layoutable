//
//  TestNode.swift
//  LayoutableTests
//
//  Created by nangezao on 2018/9/4.
//  Copyright © 2018 Tang Nan. All rights reserved.
//

import Foundation
@testable import Layoutable

class TestNode: Layoutable{

  public init() {}
  
  lazy var manager  = LayoutManager(self)
  
  var layoutSize = CGSize(width: InvalidIntrinsicMetric, height: InvalidIntrinsicMetric)

  weak var superItem: Layoutable? = nil
  
  var subItems = [Layoutable]()
  
  func addSubnode(_ node: TestNode){
    subItems.append(node)
    node.superItem = self
  }
  
  func layoutSubItems() {}
  
  func updateConstraint() {}
  
  var layoutRect: CGRect = .zero
  
  var itemIntrinsicContentSize: CGSize{
    return layoutSize
  }
  
  func contentSizeFor(maxWidth: CGFloat) -> CGSize {
    return InvaidIntrinsicSize
  }
  
}
