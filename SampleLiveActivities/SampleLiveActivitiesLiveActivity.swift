//
//  SampleLiveActivitiesLiveActivity.swift
//  SampleLiveActivities
//
//  Created by Taichi Yuki on 2025/11/11.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SampleLiveActivitiesAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SampleLiveActivitiesLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SampleLiveActivitiesAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SampleLiveActivitiesAttributes {
    fileprivate static var preview: SampleLiveActivitiesAttributes {
        SampleLiveActivitiesAttributes(name: "World")
    }
}

extension SampleLiveActivitiesAttributes.ContentState {
    fileprivate static var smiley: SampleLiveActivitiesAttributes.ContentState {
        SampleLiveActivitiesAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SampleLiveActivitiesAttributes.ContentState {
         SampleLiveActivitiesAttributes.ContentState(emoji: "🤩")
     }
}

//#Preview("Notification", as: .content, using: SampleLiveActivitiesAttributes.preview) {
//   SampleLiveActivitiesLiveActivity()
//} contentStates: {
//    SampleLiveActivitiesAttributes.ContentState.smiley
//    SampleLiveActivitiesAttributes.ContentState.starEyes
//}
