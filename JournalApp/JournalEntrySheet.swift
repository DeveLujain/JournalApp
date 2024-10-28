//import SwiftUI
//
//struct JournalEntrySheet: View {
//    @State private var title: String = ""
//    @State private var description: String = ""
//    var onSave: (JournalEntry) -> Void // Step 3: Closure to pass new entry to MainPage
//    
//    let buttonColor = Color(red: 0.643, green: 0.6, blue: 1.0)
//    
//    var currentDate: String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        return formatter.string(from: Date())
//    }
//    
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 15) {
//                ZStack(alignment: .leading) {
//                    if title.isEmpty {
//                        Text("Title")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundColor(.gray)
//                            .opacity(0.8)
//                            .padding(.leading, 4)
//                    }
//                    TextField("", text: $title)
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .opacity(0.8)
//                        .padding(.vertical, 10)
//                }
//                
//                Text(currentDate)
//                    .foregroundColor(Color(hue: 1.0, saturation: 0.055, brightness: 0.639))
//                    .opacity(0.8)
//                    .padding(.vertical, 5)
//                
//                ZStack(alignment: .topLeading) {
//                    if description.isEmpty {
//                        Text("Type your Journal...")
//                            .foregroundColor(.gray)
//                            .padding(.leading, 5)
//                            .padding(.top, 8)
//                    }
//                    TextEditor(text: $description)
//                        .font(.body)
//                        .foregroundColor(.white.opacity(0.8))
//                        .padding(.vertical, 10)
//                        .frame(minHeight: 100)
//                        .background(Color.clear)
//                        .scrollContentBackground(.hidden)
//                }
//                
//                Spacer()
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.black.edgesIgnoringSafeArea(.all))
//            .navigationTitle("New Journal")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .cancellationAction) {
//                    Button("Cancel") {}
//                        .foregroundColor(buttonColor)
//                }
//                
//                ToolbarItem(placement: .confirmationAction) {
//                    Button("Save") {
//                        let newEntry = JournalEntry(
//                            title: title,
//                            description: description,
//                            date: currentDate
//                        )
//                        onSave(newEntry) // Step 3: Pass new entry to callback
//                    }
//                    .foregroundColor(buttonColor)
//                }
//            }
//        }
//        .accentColor(.white)
//    }
//}
