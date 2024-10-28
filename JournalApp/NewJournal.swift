//import SwiftUI
//
//struct NewJournal: View {
//    @State private var showingSheet = false
//    
//    var body: some View {
//        VStack {
//            Button("Add Journal Entry") {
//                showingSheet = true
//            }
//            .sheet(isPresented: $showingSheet) {
//                JournalEntrySheet(
//                    journal: Journal(title: "", date: Date(), description: ""),
//                    onSave: { newJournal in
//                        // Handle saving the new journal entry
//                        print("Saved journal entry: \(newJournal)")
//                    }
//                )
//            }
//        }
//    }
//}
//
//struct NewJournal_Previews: PreviewProvider {
//    static var previews: some View {
//        NewJournal()
//    }
//}
