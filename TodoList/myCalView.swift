//
//  myCalView.swift
//  TodoList
//
//  Created by 봉주헌 on 2023/03/28.
//

//
//  myCalView.swift
//  CJB
//
//  Created by 봉주헌 on 2023/03/24.
//

import SwiftUI
import Combine

struct myCalView: View {
    
    @State private var showing = false
    @State private var add: String = ""
    @ObservedObject var todoStore = TodoStore()
    @State var newTodo: String = ""
    @State var isImportant: Bool = false
    
    
    struct ImportantTodo: ViewModifier {
        var importantTodoColor = Color.pink
        
        func body(content: Content) -> some View {
            return content
                .padding(.vertical, 5)
                .foregroundColor(importantTodoColor)
        }
    }
    var addTodoBar: some View{
        VStack{
            HStack{
                Button(action: {
                    isImportant.toggle()
                }, label: {
                    Image(systemName: "exclamationmark.circle")
                        .padding()
                        .foregroundColor(Color.orange)
                })
                
                TextField("할 일을 적어주세요", text: self.$newTodo)
                    .padding(10)
                    .frame(width: 250)
                    .background(RoundedRectangle(cornerRadius: 5).fill(isImportant ?  Color.orange : Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1)))
                
                Button(action: {
                    todoStore.addNew(newTodo, isImportant)
                    newTodo = ""
                    isImportant = false
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .padding()
                        .foregroundColor(Color.red)
                })
            }
            
            
        }
        
    }
    
    var body: some View {
        VStack{
            CalenderView()
            VStack{
                addTodoBar
                List{
                    ForEach(self.todoStore.todos) { todo in
                        HStack{
                            Button(action: {
                                todoStore.modifyTodoDone(todo.id)
                            }, label: {
                                Image(systemName: todo.done ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(Color.gray)
                            })
                            
                            Text(todo.todoItem)
                                .modifier(todo.done ? ImportantTodo(importantTodoColor: Color.gray) : (todo.important ? ImportantTodo() : ImportantTodo(importantTodoColor: Color.primary)))
                        }
                    }
                    .onMove(perform: self.todoStore.move)
                    .onDelete(perform: self.todoStore.delete)
                }
                
            }
            .padding()
            .frame(width: 360 ,height: 190, alignment: .top)
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(hex: 0x193B8A)))
            
        }
    }
}

struct myCalView_Previews: PreviewProvider {
    static var previews: some View {
        myCalView()
    }
}
