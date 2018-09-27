//
//  LayoutCache.swift
//  Cassowary
//
//  Created by nangezao on 2017/12/7.
//  Copyright © 2017年 nange. All rights reserved.
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

// use tuple as data struct to make it easy to write
// like node.size = (30,30) compare to UIKit node.size = CGSize(width: height: 30)
public typealias ValueType = Double
public typealias Size = (width: Double, height: Double)
public typealias Point = (x: Double, y: Double)
public typealias Offset = (x: Double, y: Double)
public typealias Insets = (top: Double,left: Double, bottom: Double,right: Double)
public typealias XSideInsets = (left: Double, right: Double)
public typealias YSideInsets = (top: Double, bottom: Double)
public typealias EdgeInsets = (top: Double, left: Double, bottom: Double, right: Double)

public typealias Rect = (origin: Point, size: Size)

public let InvalidIntrinsicMetric = Double.greatestFiniteMagnitude

public let InvaidIntrinsicSize = (InvalidIntrinsicMetric,InvalidIntrinsicMetric)

public let EdgeInsetsZero: EdgeInsets = (0,0,0,0)

public let RectZero: Rect = ((0,0),(0,0))

public let OffsetZero: Offset = (0,0)

public let SizeZero: Size = (0,0)

public struct LayoutValues{
  public var frame = RectZero
  public var subLayout = [LayoutValues]()
}

