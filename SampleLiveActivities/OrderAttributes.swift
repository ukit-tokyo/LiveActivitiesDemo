//
//  OrderAttributes.swift
//  SampleLiveActivitiesExtension
//
//  Created by Taichi Yuki on 2025/11/11.
//

import ActivityKit
import Foundation

// Live Activity の属性定義
public struct OrderAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    var status: String
    var estimatedDeliveryTime: Date

    public init(status: String, estimatedDeliveryTime: Date) {
      self.status = status
      self.estimatedDeliveryTime = estimatedDeliveryTime
    }
  }

  public var orderNumber: String

  public init(orderNumber: String) {
    self.orderNumber = orderNumber
  }
}
