import SwiftUI

struct LocationDetailView: View {

    let location: Location
    @Binding var path: NavigationPath

    var body: some View {
        VStack(spacing: 20) {

            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Image(systemName: location.weather.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 130)
                .foregroundColor(.orange)

            Text(location.temperature.temperatureText)
                .font(.title2)
                .foregroundColor(.gray)

            Text("""
A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at an evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops.
""")
            .foregroundColor(.gray)
            .padding()

            Spacer()
        }
        .padding()
        .background(Color.black.opacity(0.95))
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)

        // ✅ ONLY ADD HOME BUTTON
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    path.removeLast(path.count) // go to landing
                } label: {
                    Image(systemName: "house.fill")
                        .foregroundColor(.orange)
                }
            }
        }
    }
}


#Preview {
    LocationDetailView(
        location: locations.first!,
        path: .constant(NavigationPath())
    )
}

