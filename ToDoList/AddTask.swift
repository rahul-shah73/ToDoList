//
//  TaskAdd.swift
//  ToDoList
//
//  Created by Rahul Shah on 24/05/25.
//

import SwiftUI

struct AddTask: View {
    @State var taskName: String = ""
    @State var priority : Priority = .high
    @State var showInvalidTitleErorrAlert = false

    @Binding var tasks:  [Task]
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    
    var body: some View {
      
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if horizontalSizeClass == .compact && verticalSizeClass == .compact || horizontalSizeClass == .regular && verticalSizeClass == .compact {
                    Spacer()
                    Button(action: {
                        dismiss()}, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 25, weight : .bold))
                                .foregroundStyle(.white    )
                                .background(.black)
                               .clipShape(RoundedRectangle(cornerRadius: 5))
                               
                    })
                }
               
        }
            Text("Enter Your Task Here")
            TextField("Enter Your Task", text: $taskName)
                .padding()
                .frame(height : 30)
                .background(Color.gray.opacity(0.2))
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(style: StrokeStyle(lineWidth: 2) ))
            
            Text("Priority")
            Picker("Priority", selection: $priority) {ForEach(Priority.allCases) {priorityType
                in Text(priorityType.title)
                    .tag(priorityType)
                
            }
            }
            Button(action: {
                guard taskName.count > 2 else{
                    showInvalidTitleErorrAlert = true
                    return
                }
                let newTask = Task(title: taskName, priority: priority.rawValue, iscompleted: false)
                tasks.append(newTask)
                dismiss()
                
            }, label:{
                Text("Add Task")
                    .frame(maxWidth : .infinity)
                    .frame(height : 30)
                    .foregroundStyle(.white)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
            })
            .alert("Invalid Title",isPresented: $showInvalidTitleErorrAlert) {
                Button(action: {}, label:{
                    Text("OK")
                }) 
            
            }
           
        }
     
       
        .padding(20)
        Spacer()
    }
    
        
}

#Preview {
    AddTask(tasks: .constant([]))
}
