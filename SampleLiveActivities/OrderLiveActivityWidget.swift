//
//  OrderLiveActivityWidget.swift
//  SampleLiveActivitiesExtension
//
//  Created by Taichi Yuki on 2025/11/11.
//

import ActivityKit
import SwiftUI
import WidgetKit

struct OrderLiveActivityWidget: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: OrderAttributes.self) { context in
      // ロック画面／通知センター用 UI
      VStack {
        Text("注文番号: \(context.attributes.orderNumber)")
        Text("ステータス: \(context.state.status)")
        Text(
          "お届け予定: \(context.state.estimatedDeliveryTime.formatted(date: .omitted, time: .shortened))"
        )
        Text("注文番号: \(context.attributes.orderNumber)")
        Text("ステータス: \(context.state.status)")
        Text(
          "お届け予定: \(context.state.estimatedDeliveryTime.formatted(date: .omitted, time: .shortened))"
        )
        Text("注文番号: \(context.attributes.orderNumber)")
        Text("ステータス: \(context.state.status)")
        Text(
          "お届け予定: \(context.state.estimatedDeliveryTime.formatted(date: .omitted, time: .shortened))"
        )
      }
      .padding()
    } dynamicIsland: { context in
      // Dynamic Island 表示用 UI
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          Text("Order #\(context.attributes.orderNumber)")
        }
        DynamicIslandExpandedRegion(.trailing) {
          Text(context.state.status)
        }
        DynamicIslandExpandedRegion(.bottom) {
          Text(
            "ETA: \(context.state.estimatedDeliveryTime.formatted(date: .omitted, time: .shortened))"
          )
        }
      } compactLeading: {
        Text("Order #\(context.attributes.orderNumber)")
      } compactTrailing: {
        Text(context.state.status)
      } minimal: {
        Text(context.state.status)
      }
    }
  }
}

#Preview("Order", as: .content, using: OrderAttributes(orderNumber: "12345"))
{
  OrderLiveActivityWidget()
} contentStates: {
  OrderAttributes.ContentState(status: "hoge", estimatedDeliveryTime: Date())
}
