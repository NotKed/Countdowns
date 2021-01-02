//
//  ContentView.swift
//  Countdowns
//
//  Created by Kyle Edwards on 01/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var countdowns: FetchedResults<Countdown>
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countdowns) { countdown in
                    DisclosureGroup(countdown.name!, isExpanded: $isExpanded) {
                        
                    }
                }.onDelete(perform: deleteTasks)
            }
            .navigationTitle("Countdowns")
            .navigationBarItems(trailing: Button("Add Countdown") {
                addCountdown()
            })
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved error: \(error)")
        }
    }
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { countdowns[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    private func addCountdown() {
        withAnimation {
            let newCountdown = Countdown(context: viewContext)
            newCountdown.name = "New Countdown"
            newCountdown.date = Date()
            
            saveContext()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func log(_ text: String) -> EmptyView {
    print("** \(text)")
    return EmptyView()
}
