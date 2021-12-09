//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Dmitry Sharabin on 08.12.2021.
//

import CoreData
import SwiftUI

//struct FilteredList: View {
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
//
//    var body: some View {
//        List(fetchRequest, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
//    }
//
//    init(filter: String) {
//        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
//}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    enum Predicate: String {
        case beginsWith = "BEGINSWITH"
        case contains = "CONTAINS"
        case eq = "=="
        case lt = "<"
        case gt = ">"
    }
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, predicate: Predicate, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}
