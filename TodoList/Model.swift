//
//  Model.swift
//  TodoList
//
//  Created by 봉주헌 on 2023/03/27.
//

import SwiftUI

struct Todo: Identifiable, Codable{
    var id = UUID()
    let todoItem: String
    let important: Bool
    var done: Bool = false
}
