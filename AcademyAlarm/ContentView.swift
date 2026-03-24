//
//  ContentView.swift
//  AcademyAlarm
//
//  Created by User on 24/03/26.
//

import SwiftUI

struct ContentView: View {
    //TODO: annotate alarms with @State to make it mutable and reactive
    var alarms: [Alarm] = [
        Alarm(time: Calendar.current.date(byAdding: .hour, value: 7, to: Date())!, label: "Morning Jog"),
        Alarm(time: Calendar.current.date(byAdding: .hour, value: 22, to: Date())!, label: "Bedtime")
    ]
    
    //TODO: annotate isShowingAddModal with @State to control add alarm sheet presentation
    var isShowingAddModal = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Alarms List
                if alarms.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "moon.zzz")
                            .font(.system(size: 64))
                            .foregroundStyle(.secondary)

                        Text("No alarms yet")
                            .font(.title3)
                            .fontWeight(.semibold)

                        Text("Create your first alarm")
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // TODO: Use ForEach with $binding to allow editing alarms in AlarmListRow
                    List {
                        ForEach(alarms) { alarm in
                            AlarmListRow(alarm: alarm)
                        }
                        .onDelete { indices in
                            // TODO: Implement deletion of alarms at specified indices
                        }
                    }
                    .listStyle(.inset)
                }

                // MARK: - Add Button
                VStack {
                    Button(
                        action: {
                            // TODO: Set isShowingAddModal to true to present the add alarm sheet
                        }
                    ) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Alarm")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                }
                .background(Color(.systemBackground))
            }
            .navigationTitle("Alarms")
            .navigationBarTitleDisplayMode(.inline)
            // TODO: Present AddAlarmSheet modal when isShowingAddModal is true
            .sheet(isPresented: .constant(isShowingAddModal)) {
                // TODO: Pass alarms and isShowingAddModal as bindings to AddAlarmSheet for adding new alarms and dismissing the sheet
                AddAlarmSheet(alarms: alarms, isPresented: isShowingAddModal)
            }
        }
    }
}

// MARK: - Alarm List Row
struct AlarmListRow: View {
    // TODO: Annotate alarm with @Binding to allow editing its properties in EditAlarmSheet
    var alarm: Alarm
    // TODO: Annotate isShowingEditModal with @State to control edit alarm sheet presentation
    var isShowingEditModal = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(alarm.label)
                    .fontWeight(.semibold)

                Text(alarm.formattedTime())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            // TODO: Bind toggle to alarm.isActive to allow toggling active state directly from the list row
            Toggle("", isOn: .constant(alarm.isActive))
                .tint(.blue)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            // TODO: Set isShowingEditModal to true to present the edit alarm sheet when the row is tapped
        }
        // TODO: Present EditAlarmSheet modal when isShowingEditModal is true
        .sheet(isPresented: .constant(isShowingEditModal)) {
            EditAlarmSheet(alarm: alarm, isPresented: isShowingEditModal)
        }
    }
}

// MARK: - Add Alarm Sheet
struct AddAlarmSheet: View {
    // TODO: Annotate alarms and isPresented with @Binding to allow adding new alarms to the list and dismissing the sheet
    var alarms: [Alarm]
    // TODO: Annotate isPresented with @State to control sheet presentation
    var isPresented: Bool

    @State private var label = ""
    @State private var time = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section("Alarm Details") {
                    TextField("Label", text: $label)

                    DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                }

                Section {
                    Button(action: saveAlarm) {
                        HStack {
                            Spacer()
                            Text("Add")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .foregroundStyle(.blue)
                }
            }
            .navigationTitle("New Alarm")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        // TODO: Dismiss the sheet by setting isPresented to false when cancel button is tapped
                    }
                }
            }
        }
    }

    private func saveAlarm() {
        // TODO: Implement saveAlarm function
        // Steps:
        // 1. Create new Alarm instance with label, time, and isActive set to true
//        let newAlarm = Alarm(
//            time: time,
//            label: label.isEmpty ? "Alarm" : label,
//            isActive: true
//        )
        // 2. Append to alarms array
//        alarms.append(newAlarm)
        // 3. Dismiss the sheet by setting isPresented to false
//        isPresented = false
    }
}

// MARK: - Edit Alarm Sheet
struct EditAlarmSheet: View {
    // TODO: Annotate alarm with @Binding to allow editing its properties and isPresented with @Binding to control sheet presentation
    var alarm: Alarm
    // TODO: Annotate isPresented with @State to control sheet presentation
    var isPresented: Bool

    var body: some View {
        NavigationStack {
            Form {
                // TODO: Bind TextField to alarm.label, DatePicker to alarm.time, and Toggle to alarm.isActive to allow editing these properties in the sheet
                Section("Alarm Details") {
                    TextField("Label", text: .constant(alarm.label))
                    DatePicker("Time", selection: .constant(alarm.time), displayedComponents: .hourAndMinute)
                    Toggle("Active", isOn: .constant(alarm.isActive))
                }

                Section {
                    Button(
                        action: {
                            //TODO: done action that dismisses the modal
                        }
                    ) {
                        HStack {
                            Spacer()
                            Text("Done")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    .foregroundStyle(.blue)
                }
            }
            .navigationTitle("Edit Alarm")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
