import SwiftUI

struct JournalEntrySheet: View {
    @Environment(\.dismiss) var dismiss
    @State var journal: Journal
    var onSave: (Journal) -> Void
    
    let buttonColor = Color(red: 0.643, green: 0.6, blue: 1.0) // Hex color #A499FF
    
    
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                
                ZStack(alignment: .leading) {
                    if journal.title.isEmpty {
                        Text("Title")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .opacity(0.8)
                            .padding(.leading, 4)
                    }
                    TextField("", text: $journal.title)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .opacity(0.8) // Match the style of the date
                        .padding(.vertical, 10)
                }
                
               
                Text(currentDate)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.055, brightness: 0.639))
                    .opacity(0.8) // Similar opacity
                    .padding(.vertical, 5)
                
                // Description input
                ZStack(alignment: .topLeading) {
                    if journal.description.isEmpty {
                        Text("Type your Journal...")
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                            .padding(.top, 8)
                    }
                    TextEditor(text: $journal.description)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.vertical, 10)
                        .frame(minHeight: 100)
                        .background(Color.clear)
                        .scrollContentBackground(.hidden)
                }
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all)) 
            .navigationTitle("New Journal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(buttonColor) // Hex #A499FF
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(journal)
                        dismiss()
                    }
                    .foregroundColor(buttonColor) // Hex #A499FF
                }
            }
        }
        .accentColor(.white) // White accent for elements
    }
}
