//
//  DateRangePicker.swift
//  test
//
//  Created by Kirill Polyakov on 21.03.2023.
//

import SwiftUI

struct DateRangePicker: View {
    @Binding var startDate: Date
    @Binding var endDate: Date

    var body: some View {
        HStack {
            VStack {
                Text("From:")
                DatePicker("", selection: $startDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
            }

            VStack {
                Text("To:")
                DatePicker("", selection: $endDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .labelsHidden()
            }
        }
    }
}

