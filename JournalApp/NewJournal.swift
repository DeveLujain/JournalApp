import SwiftUI

struct NewJournal: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Button("Add Journal Entry") {
                showingSheet = true
            }
            .sheet(isPresented: $showingSheet) {
                JournalEntrySheet()
            }
        }
    }
}

struct JournalEntrySheet: View {
    @State private var title: String = ""
    @State private var description: String = ""
    
    let buttonColor = Color(red: 0.643, green: 0.6, blue: 1.0) // Hex color #A499FF
    
    // Get current date as a formatted string
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                
                // Title input styled like the date
                ZStack(alignment: .leading) {
                    if title.isEmpty {
                        Text("Title")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .opacity(0.8)
                            .padding(.leading, 4)
                    }
                    TextField("", text: $title)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .opacity(0.8) // Match the style of the date
                        .padding(.vertical, 10)
                }
                
                // Auto-set date display
                Text(currentDate)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.055, brightness: 0.639))
                    .opacity(0.8) // Similar opacity
                    .padding(.vertical, 5)
                
                // Description input
                ZStack(alignment: .topLeading) {
                    if description.isEmpty {
                        Text("Type your Journal...")
                            .foregroundColor(.gray)
                            .padding(.leading, 5)
                            .padding(.top, 8) // Adjust padding to align
                    }
                    TextEditor(text: $description)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.vertical, 10)
                        .frame(minHeight: 100)
                        .background(Color.clear) // Transparent background
                        .scrollContentBackground(.hidden) // Hide default white background
                }
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.black.edgesIgnoringSafeArea(.all)) // Black background
            .navigationTitle("New Journal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        // Dismiss the sheet (use dismiss in real apps)
                    }
                    .foregroundColor(buttonColor) // Hex #A499FF
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // Save the journal entry (add functionality)
                    }
                    .foregroundColor(buttonColor) // Hex #A499FF
                }
            }
        }
        .accentColor(.white) // White accent for elements
    }
}

struct NewJournal_Previews: PreviewProvider {
    static var previews: some View {
        NewJournal()
    }
}
