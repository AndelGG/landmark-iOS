import SwiftUI

struct ContentView: View {
    var body: some View {
        AuthenticatedView()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
        .environment(AuthenticationManager())
}
