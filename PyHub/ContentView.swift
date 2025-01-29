import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle().frame(width: 500, height: 1000)
                Circle().fill(Color.white)
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                    Button("Go to GitHub") {
                        openGitHub()
                    }
                }
                
            }
        }
        .padding()
    }
    
    func openGitHub() {
        if let url = URL(string: "https://github.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    ContentView()
}
