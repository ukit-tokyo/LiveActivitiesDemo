//
//  ContentView.swift
//  LiveActivitiesDemo
//
//  Created by Taichi Yuki on 2025/11/11.
//

import ActivityKit
import SwiftUI
import SampleLiveActivitiesExtension

struct ContentView: View {
  var body: some View {
    VStack {
      Button("Add Live Activity") {
        Task {
          await startLiveActivity()
        }
      }
      .padding(.top)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}

// MARK: -

func startLiveActivity() async {
  let attributes = OrderAttributes(orderNumber: "12345")
  let initialState = OrderAttributes.ContentState(
    status: "調理中",
    estimatedDeliveryTime: Date().addingTimeInterval(30 * 60)  // 30分後
  )

  do {
    let activity = try Activity.request(
      attributes: attributes,
      contentState: initialState,
      pushType: .token  // プッシュ通知での更新を可能にする
    )
    print("Live Activity started: \(activity.id)")
  } catch {
    print("Failed to start Live Activity: \(error)")
  }
}

func updateLiveActivity(activity: Activity<OrderAttributes>) async {
  let updatedState = OrderAttributes.ContentState(
    status: "配達中",
    estimatedDeliveryTime: Date().addingTimeInterval(10 * 60)  // 10分後
  )

  await activity.update(using: updatedState)
}

func endLiveActivity(activity: Activity<OrderAttributes>) async {
  let finalState = OrderAttributes.ContentState(
    status: "配達完了",
    estimatedDeliveryTime: Date()
  )

  await activity.end(using: finalState, dismissalPolicy: .immediate)
}
