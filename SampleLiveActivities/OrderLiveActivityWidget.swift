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
    let url = URL(string: "https://sta.test.tabi-wester.westjr.co.jp/images/ticket/e2163ac5785f60bc21952591897111de.jpg")
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: OrderAttributes.self) { context in
      // ロック画面／通知センター用 UI
        Link(destination: URL(string: "https://example.com")!) {
            VStack(spacing: 8) {
                //        Text("注文番号: \(context.attributes.orderNumber)")
                //        Text("ステータス: \(context.state.status)")
                //        Text(
                //          "お届け予定: \(context.state.estimatedDeliveryTime.formatted(date: .omitted, time: .shortened))"
                //        )
                Text("XXXチケット利用中")
                    .font(.system(size: 16, weight: .bold))
                HStack {
                    Image(.icon60)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                    //                AsyncImage(url: url) { phase in
                    //                    if let image = phase.image {
                    //                        image
                    //                            .resizable()
                    //                            .scaledToFill()
                    //                            .frame(width: 100, height: 70)
                    //                            .clipped()
                    //                    }
                    //                }
                    Text("有効期限 : \(Date())")
                        .font(.system(size: 14))
                }
                //          Text(
                //            "お届け予定: \(context.state.estimatedDeliveryTime.formatted(date: .omitted, time: .shortened))"
                //          )
            }
            .padding()
        }

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
//
//#Preview("Order", as: .content, using: OrderAttributes(orderNumber: "12345"))
//{
//  OrderLiveActivityWidget()
//} contentStates: {
//  OrderAttributes.ContentState(status: "hoge", estimatedDeliveryTime: Date())
//}
