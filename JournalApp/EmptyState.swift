//
//  EmptyState.swift
//  JournalApp
//
//  Created by Lujain sh on 20/10/2024.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ZStack{
            Image("BG")
            Image("Diary")
                .resizable()
            .frame(width: 77.0, height: 101.0)
            
            Text("Begin Your Journal")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.831, green: 0.7843137254901961, blue: 1.0))
                .padding(.top, 150.0)
            
            Text ("Craft your personal diary, tap the plus icon to begin")
                .foregroundColor(Color.white)
                .padding(.top, 190.0)
            
            VStack{
                Text("JOURNAL")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 620.24)
                    }
        }
         
        
    }
}

#Preview {
    EmptyState()
}
