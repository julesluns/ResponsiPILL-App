//
//  ThirdView.swift
//  ResponsiPILL App
//
//  Created by Julia Luna on 6/14/23.
//

import SwiftUI

struct Reminders: View {
    @Environment(\.managedObjectContext) var context
    
    // @State var toDoItems: [ToDoItem] = []
    @State private var showNewTask = false
    
    @FetchRequest(entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("myCoralOrange"), Color(.white)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    Text("Reminders")
                        .font(.largeTitle)
                    
                    Spacer()
                    //button
                    Button(action: {
                        self.showNewTask = true
                    }) {
                        Text("+")
                    }
                }
                .padding()
                
                Spacer()
                
                List{
                    ForEach(toDoItems){ toDoItem in
                        if toDoItem.isImportant == true {
                            Text("‼️" + (toDoItem.title ?? "No title"))
                        } else {
                            Text(toDoItem.title ?? "No title")
                        }
                        
                    }
                    .onDelete(perform: deleteTask)
                }
                if showNewTask {
                    NewToDoView(title: "", isImportant: false,showNewTask: $showNewTask)
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                NavigationLink(destination: Information()) {
                    Text("Information")
                    //                            .padding([.top, .leading])
                }
                Spacer()
                
                NavigationLink(destination: Reminders()) {
                    Text("Reminders")
                    //                                .padding([.top, .leading, .trailing])
                    
                }
                Spacer()
                
                NavigationLink(destination: Journal()) {
                    Text("Journal")
                    //                                .padding([.top, .trailing])
                }
                Spacer()
}
}
        }
        func deleteTask(offsets: IndexSet) {
            withAnimation {
                offsets.map { toDoItems[$0] }.forEach(context.delete)
                
                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    

                    
                    }
    //}

    
    struct Reminders_Previews: PreviewProvider {
        static var previews: some View {
            Reminders()
        }
    }

