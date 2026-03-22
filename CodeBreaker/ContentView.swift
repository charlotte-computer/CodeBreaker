import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("machine")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            VStack {
                pegs(colors: [PegItem(color: .green), PegItem(color: .green), PegItem(color: .green), PegItem(color: .red)])
                pegs(colors: [PegItem(color: .yellow), PegItem(color: .blue), PegItem(color: .green), PegItem(color: .red)])
                pegs(colors: [PegItem(color: .blue), PegItem(color: .blue), PegItem(color: .blue), PegItem(color: .yellow)])
                
                pegs(colors: [PegItem(color: .blue), PegItem(color: .blue), PegItem(color: .blue), PegItem(color: .yellow)])
                pegs(colors: [PegItem(color: .blue), PegItem(color: .blue), PegItem(color: .blue), PegItem(color: .yellow)])
            }
            .padding()
        }
    }
    
    func pegs(colors: [PegItem]) -> some View {
        HStack(spacing: 20) {
            ForEach(colors) { x in
                GlassPeg(color: x.color)
            }
        }
    }
}

struct PegItem: Identifiable {
    let id = UUID()
    let color: Color
}

struct GlassPeg: View {
    var color: Color
    
    var body: some View {
        Circle()
            .fill(color.gradient.opacity(0.4))
    
            .frame(width: 70.0, height: 70.0)
            .glassEffect()
            
    }
}

#Preview {
    ContentView()
}
