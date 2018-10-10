//
//  LayoutTest.swift
//  LayoutableTests
//
//  Created by nangezao on 2018/10/10.
//  Copyright © 2018 Tang Nan. All rights reserved.
//

import XCTest
@testable import Layoutable

class LayoutTest: XCTestCase {

  override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
  }


  func testExample() {
    let node = TestNode()
    let node1 = TestNode()
    let node2 = TestNode()
    
    node.addSubnode(node1)
    node.addSubnode(node2)
    
    node1.size == (30,30)
    node2.size == (40,40)
    
    [node,node1].equal(.centerY,.left)
    
    [node2,node].equal(.top,.bottom,.centerY,.right)
    
    [node1,node2].space(10, axis: .horizontal)
    
    node.layoutIfEnabled()
    
    XCTAssertEqual(node1.layoutRect, CGRect(x: 0, y: 5, width: 30, height: 30))
    XCTAssertEqual(node2.layoutRect, CGRect(x: 40, y: 0, width: 40, height: 40))
    XCTAssertEqual(node.layoutRect, CGRect(x: 0, y: 0, width: 80, height: 40))
  }

}
