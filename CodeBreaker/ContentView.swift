import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("machine")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                pegs(colors: [.red, .green, .blue, .yellow])
                pegs(colors: [.red, .red, .blue, .yellow])
                pegs(colors: [.red, .blue, .blue, .yellow])
                pegs(colors: [.blue, .yellow, .yellow, .yellow])

            }
            .padding()
            .glassEffect(in: .rect(cornerRadius: 20))
        }
    }

    func pegs(colors: [Color]) -> some View {
        HStack {

            ForEach(colors.indices, id: \.self) {
                index in
                Circle().fill(colors[index].gradient.opacity(0.5)).glassEffect()
                    .aspectRatio(contentMode: .fit)
            }
            MatchMarkers(matches: [.exact, .nomatch, .exact, .inexact])
        }
    }
}



#Preview {
    ContentView()
}
