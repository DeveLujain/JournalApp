//
//  ContentView.swift
//  JournalApp
//
//  Created by Lujain sh on 20/10/2024.
//
//SPLAAAASH SCREEN
import SwiftUI

struct ContentView: View {
  
    
    
    
    var body: some View {
        
        ZStack{
            Image("BG")
            
            VStack {
                Image("Diary")
                    .resizable()
                    .frame(width: 77.0, height: 101.0)
                
                
                Text("Journali")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                    .padding(.top, 15.0)
                
                Text("Your thoughts, your story")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .padding(.top, -16.521)
            }
        }
    }
}
    #Preview {
        ContentView()
    }



