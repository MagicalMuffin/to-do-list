//
//  ContentView.swift
//  to-do-list
//
//  Created by StudentAM on 3/5/24.
//

import SwiftUI
//Make sure to add comments
struct ContentView: View {
    @State private var count: Int = 0
    @State private var newItem: String = ""
    @State private var items: [String] = []
    @State private var showAlert: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Number of tasks: \(count)")
                        .padding()
                    Spacer()
                }
                TextField("Enter a new task", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    HStack {
                        Button(action: {
                            if newItem.isEmpty{
                                showAlert = true
                                return
                            }
                            count += 1
                            items.append(newItem)
                            showAlert = false
                           
                        }, label:{
                            Text("Add Task")
                                .padding()
                                .background(newItem.count > 0 ? Color.blue: Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        })
                       // .disabled(newItem.isEmpty)
                        .alert(isPresented: .constant(showAlert)) {
                            Alert(title: Text("Error"), message: Text("Please enter a task"), dismissButton: .default(Text("OK")))
                                            }
                        Button(action: {
                                items.removeAll()
                                count = 0
                                showAlert = false
                        }, label:{
                            Text("Remove All Tasks")
                                .padding()
                                .background(items.count > 0 ? Color.blue: Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        })
                    }
                    Spacer()
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                }.navigationTitle("To-Do List")
            }
        }
    }
}
#Preview {
    ContentView()
}
