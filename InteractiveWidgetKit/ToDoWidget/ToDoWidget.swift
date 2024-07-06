//
//  ToDoWidget.swift
//  ToDoWidget
//
//  Created by Melik Demiray on 9.01.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ToDoEntry {
        ToDoEntry(toDoDisplay: Array(SharedData.shared.toDos.prefix(3)))
    }

    func getSnapshot(in context: Context, completion: @escaping (ToDoEntry) -> ()) {
        let entry = ToDoEntry(toDoDisplay: Array(SharedData.shared.toDos.prefix(3)))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        let entries = Array(SharedData.shared.toDos.prefix(3))
        let timeline = Timeline(entries: [ToDoEntry(toDoDisplay: entries)], policy: .atEnd)
        completion(timeline)
    }
}

struct ToDoEntry: TimelineEntry {
    let date: Date = .now
    let toDoDisplay: [ToDo]
}

struct ToDoWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("ToDos")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 2)
            VStack (alignment: .leading) {
                ForEach(entry.toDoDisplay) { toDo in
                    HStack {
                        Button(intent: CompleteToDoIntent(id: toDo.id)) {
                            Image(systemName: toDo.isDone ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(toDo.isDone ? .green : .red)
                        }.buttonStyle(.plain)
                        VStack(alignment: .leading) {
                            Text(toDo.name).lineLimit(1)
                                .strikethrough(toDo.isDone, pattern: .solid)

                        }
                    }
                    Divider()
                }
            }

        }
    }
}

struct ToDoWidget: Widget {
    let kind: String = "ToDoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ToDoWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ToDoWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
            .configurationDisplayName("ToDo Widget")
            .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    ToDoWidget()
} timeline: {
    ToDoEntry(toDoDisplay: Array(SharedData.shared.toDos.prefix(3)))

}
