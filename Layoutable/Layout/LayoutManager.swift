//
//  LayoutManager.swift
//  Layoutable
//
//  Created by nangezao on 2018/9/21.
//  Copyright © 2018 Tang Nan. All rights reserved.
//
//
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Cassowary

/// LayoutManager hold and handle all the properties needed for layout
/// like SimplexSolver, LayoutProperty ...
/// so that the class conform to LayoutItem does not need to provide those properties
final public class LayoutManager{
  
  weak var solver: SimplexSolver?
  
  var variable = LayoutProperty(scale: Double(UIScreen.main.scale))
  
  // This property is used to adjust position after layout pass
  // It is useful for simplefy layout for irregular layout
  public var offset = CGPoint.zero
  
  /// just like translateAutoSizingMaskIntoConstraints in autolayout
  /// if true, current frame of this item will be added to layout engine
  public var translateRectIntoConstraints = true
  
  public var enabled = true
  
  /// to indicator whether contentSize of this item is changed
  /// if true, contentSize constraints will be updated
  public var layoutNeedsUpdate = false
  
  /// used to track all consytraints that self if the secondAnchor.item
  var pinedConstraints = Set<LayoutConstraint>()
  
  /// constraints for this item that has been added to solver
  var constraints = Set<LayoutConstraint>()
  
  /// constraints for this item that need to be added to solver
  private var newAddConstraints = Set<LayoutConstraint>()
  
  // frequency used Constraint,hold directly to improve performance
  var width: LayoutConstraint?
  var height: LayoutConstraint?
  
  /// used for frame translated constraint
  var minX: LayoutConstraint?
  var minY: LayoutConstraint?
  
  
  /// whether this item should constrainted by rect translated constraints
  var isRectConstrainted: Bool{
    return translateRectIntoConstraints && !pinedConstraints.isEmpty
  }
  
  var isConstraintValidRect: Bool{
    return solver != nil && !translateRectIntoConstraints
  }
  
  var sizeNeedsUpdate: Bool{
    return layoutNeedsUpdate && !translateRectIntoConstraints
  }
  
  public init(){}
  
  func addConstraintsTo(_ solver: SimplexSolver){
    
    // maybe need optiomize
    // find a better way to manager constraint cycle
    // when to add ,when to remove
    self.solver = solver
    variable.solver = solver
    updateConstraint()
  }
  
  /// add new constraints to current solver
  func updateConstraint(){
    if let solver = self.solver{
      newAddConstraints.forEach {
        $0.addToSolver(solver)
        constraints.insert($0)
      }
      newAddConstraints.removeAll()
    }
  }
  
  func addConstraint(_ constraint: LayoutConstraint){
    newAddConstraints.insert(constraint)
  }
  
  func removeConstraint(_ constraint: LayoutConstraint){
    newAddConstraints.remove(constraint)
    constraints.remove(constraint)
  }
  
  /// update content size Constraint
  func updateSize(_ size: CGSize,node: Layoutable, priority: LayoutPriority = .strong){
    
    if size.width != UIView.noIntrinsicMetric{
      if let width = width{
        width.constant = size.width
      }else{
        width =  node.width == size.width ~ priority
      }
    }
    
    if size.height != UIView.noIntrinsicMetric{
      if let height = height{
        height.constant = size.height
      }else{
        height = node.height == size.height ~ priority
      }
    }
  }
  
  /// update content size Constraint
  func updateOrigin(_ point: CGPoint,node: Layoutable, priority: LayoutPriority = .required){
    
    if let minX = minX{
      minX.constant = point.x
    }else{
      minX =  node.left == point.x ~ priority
    }
    
    if let minY = minY{
      minY.constant = point.y
    }else{
      minY = node.top == point.y ~ priority
    }
  }
  
  /// final caculated rect for this item
  var layoutRect: CGRect{
    return variable.frame.offsetBy(dx: offset.x,dy: offset.y)
  }
}
