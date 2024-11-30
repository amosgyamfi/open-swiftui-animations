import SwiftUI

struct IncreaseDecrease: View {
    @State private var rating: Int = 0
    
    var body: some View {
        HStack(spacing: 20) {
            // Decrease button
            Button("Decrease", systemImage: "minus.circle") {
                withAnimation {
                    rating -= 1
                }
            }
            .disabled(rating == 0)
            
            Spacer()
            // Rating display
            Text(rating, format: .number)
                .contentTransition(.numericText())
                .font(.title)
                .bold()
                .disabled(rating == 10)
            Spacer()
            // Increase button
            Button("Increase", systemImage: "plus.circle") {
               withAnimation {
                    rating += 1
                }
            }
            .disabled(rating == 10)
    
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    IncreaseDecrease()
}


