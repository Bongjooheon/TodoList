//
//  CalenderView.swift
//  TodoList
//
//  Created by 봉주헌 on 2023/03/28.
//
//
//  CalenderView.swift
//  CJB
//
//  Created by 봉주헌 on 2023/03/24.
//

import SwiftUI

struct CalenderView: View {
    
    @State var selectedDate: Date = Date()
    @State var toDoString: String = ""
    
    var body: some View {
        VStack() {
            Text("이번달 할 일")
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color.gray)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
            Divider().frame(height: 1)
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
            Divider()
        }
        }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
