import SwiftUI

struct LandingView: View {

    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            
            Spacer()

            VStack(spacing: 24) {

                Image(systemName: "umbrella.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .foregroundColor(.orange)

                Text("Breeze")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Welcome to\nKushagra’s Weather App")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)

                Button {
                    path.append(AppRoute.list)
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.orange)
                }
                .padding(.top, 10)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.95))
    }
}


