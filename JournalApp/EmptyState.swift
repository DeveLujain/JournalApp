

//
//  EmptyState.swift
//  JournalApp
//
//  Created by Lujain sh on 20/10/2024.
//

import SwiftUI

struct EmptyState: View {
    @State private var showingSheet = false // Step 1: Add state variable
    
    var body: some View {
        ZStack {
            Image("BG")
            VStack {
                Image("Diary")
                    .resizable()
                    .frame(width: 77.0, height: 101.0)
            }
            
            Text("Begin Your Journal")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.831, green: 0.7843137254901961, blue: 1.0))
                .padding(.top, 180)
            
            Text("Craft your personal diary, tap the plus icon to begin")
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding([.top, .leading, .trailing], 240.0)
                .padding(.top, 40.0)
            
            VStack {
                HStack {
                    Text("Journal")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 650.0)
                        .padding(.trailing, 140.0)
                    
                    Button(action: {})
                    {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 35.0, height: 35.0)
                            .padding(.bottom, 650.0)
                            .padding(.trailing, 3.0)
                            .overlay (
                                Image(systemName: "line.3.horizontal.decrease")
                                    .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0))
                                    .padding(.bottom, 650.0)
                                    .padding(.trailing, 3.0)
                            )
                    }
                    
                    Button(action: {
                        showingSheet = true
                    }) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 35, height: 35)
                            .padding(.bottom, 650.0)
                            .padding(.trailing, 3.0)
                            .overlay (
                                Image(systemName: "plus")
                                    .foregroundColor(Color(red: 0.8313725490196079, green: 0.7843137254901961, blue: 1.0))
                                    .padding(.bottom, 650.0)
                                    .padding(.trailing, 3.0)
                            )
                    }
                                    }
            }
        }
    }
    
    struct EmptyState_Previews: PreviewProvider {
        static var previews: some View {
            EmptyState()
        }
    }
}
#Preview {
    EmptyState()
}
