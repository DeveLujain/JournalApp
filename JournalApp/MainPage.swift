import SwiftUI

struct MainPage: View {
    @State private var showingSheet = false
    @State private var editingJournal: Journal?
    @State private var searchText = ""
    @State private var showBookmarkedOnly = false
    @State private var filterByDate = false // New state variable for date filter
    @State private var journals: [Journal] = [
        Journal(title: "My Birthday", date: Date(), description: "Today I had so much fun!"),
        Journal(title: "Family Gathering", date: Date(), description: "Spent quality time with family.")
    ]
    
    var filteredJournals: [Journal] {
        journals.filter { journal in
            // Filter by bookmark if enabled
            let bookmarkFilter = !showBookmarkedOnly || journal.isBookmarked
            
            // Filter by date if enabled (e.g., show only today's journals)
            let dateFilter = !filterByDate || Calendar.current.isDateInToday(journal.date)
            
            return bookmarkFilter && dateFilter
        }
    }
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Top Header
                HStack {
                    Text("Journal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    // Filter button with menu options
                    Menu {
                        Button(action: {
                            showBookmarkedOnly.toggle()
                        }) {
                            Text("Bookmark")
                        }
                        
                        Button(action: {
                            filterByDate.toggle()
                        }) {
                            Text("Journal Date")
                        }
                    } label: {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 35.0, height: 35.0)
                            .overlay(
                                Image(systemName: "line.3.horizontal.decrease")
                                    .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))
                            )
                    }
                    
                    // Plus button
                    Button(action: {
                        editingJournal = nil // Clear any existing editing journal
                        showingSheet = true
                    }) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 35, height: 35)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))
                            )
                    }
                    .sheet(isPresented: $showingSheet) {
                        JournalEntrySheet(
                            journal: editingJournal ?? Journal(title: "", date: Date(), description: ""),
                            onSave: { journal in
                                if let index = journals.firstIndex(where: { $0.id == journal.id }) {
                                    journals[index] = journal // Update existing journal
                                } else {
                                    journals.append(journal) // Add new journal
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchText)
                        .foregroundColor(.white)
                        .padding(.vertical, 6.0)
                }
                .padding(.horizontal)
                .background(Color.white.opacity(0.07))
                .cornerRadius(12)
                .padding([.leading, .bottom, .trailing], 14.0)
                
                // List of journal entries with swipe actions
                List {
                    ForEach(filteredJournals.indices, id: \.self) { index in
                        JournalCell(
                            journal: $journals[index],
                            onEdit: {
                                editingJournal = journals[index]
                                showingSheet = true
                            },
                            onDelete: {
                                journals.removeAll { $0.id == journals[index].id }
                            }
                        )
                        .listRowBackground(Color.clear)
                        .cornerRadius(15)
                        .padding(.vertical, 5)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
                
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    MainPage()
}
