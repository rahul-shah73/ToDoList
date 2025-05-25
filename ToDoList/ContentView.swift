//
//  ContentView.swift
//  ToDoList
//
//  Created by Rahul Shah on 24/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var tasks :[Task] = []
    @State var taskViewPresent = false
    var body: some View {
        NavigationStack{
            
            VStack{
                
                HStack{
                    Text("To Do List")
                        .font(.system(size: 30, weight: .bold))
                    Spacer()
                    VStack{
                        Button(action: {
                            taskViewPresent = true
                        }) {
                            Text("+")
                                .font(.system(size:30, weight : .bold))
                                .frame(width : 45, height : 45)
                                .foregroundStyle(.white)
                                .background(Circle())
                            
                            
                        }
                        .sheet(isPresented: $taskViewPresent, content: {
                            AddTask(tasks: $tasks)
                        })
                    }
                }
                .padding(10)
            }
            VStack{
                List{
                    ForEach($tasks){$task in
                        Button(action: {
                            if let taskIndex = tasks.firstIndex(where: {
                                $0.id == task.id})
                            {
                                tasks[taskIndex] = Task(title: task.title, priority: task.priority, iscompleted: !task.iscompleted)
                                
                            }
                        }, label: {
                            HStack {
                                Text(task.title)
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundStyle(Color.black.opacity(task.iscompleted ? 0.5 : 1))
                           .strikethrough(task.iscompleted)
                                Spacer()
                                Text(task.priority.capitalized)
                                    .font(.system(size: 20, weight: .regular))
                                    .foregroundStyle(.red)
                            }
                        })
                    }
                    .listRowBackground(Color.gray.opacity(0.2))
                }
             
            }
         
            .scrollContentBackground(.hidden)
         
        }

    }
}

#Preview {
    ContentView()
}
