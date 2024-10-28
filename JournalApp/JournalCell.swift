// JournalCell.swift
import SwiftUI

struct JournalCell: View {
    @Binding var journal: Journal
    var onEdit: () -> Void
    var onDelete: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(journal.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))
                
                Spacer()
                
                Button(action: {
                    journal.isBookmarked.toggle()
                }) {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))
                        .frame(width: 14.622, height: 24.0)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Text(formatDate(journal.date))
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(journal.description)
                .font(.body)
                .foregroundColor(.white)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(Color.black.opacity(0.7))
        .cornerRadius(15)
        .swipeActions(edge: .trailing) {
            Button(action: onDelete) {
                Image(systemName: "trash")
            }
            .tint(.red)
        }
        .swipeActions(edge: .leading) {
            Button(action: onEdit) {
                Image(systemName: "pencil")
            }
            .tint(.blue)
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
