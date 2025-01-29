import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)


            CircleImage()
                .offset(y: -230)
                .padding(.bottom, -350)


            VStack(alignment: .leading) {
                Text("Shpack Vitaliy")
                    .font(.title)
                HStack {
                    Text("Det Dom")
                    Spacer()
                    Text("Gnomel")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()


            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
