import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var navigateToNextScreen = false
    
    var body: some View {
        
        NavigationView {
            if isActive {
                MainPage()
                
            } else {
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
                        // Placeholder for splash screen image
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.2)) {
                                }
                            }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                            self.isActive = true // Set isActive to true after 2 seconds
                        }
                    }
                }
            }
        }
    }
    
    struct NewEmptyState: View {
        var body: some View {
            VStack {
                Text("New Empty State")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
    
    struct SplashScreen_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreen()
        }
    }
}
#Preview {
    SplashScreen()
}
