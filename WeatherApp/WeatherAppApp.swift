import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear {
                    
                    // BASE URL
                    if let baseURL = Bundle.main.object(
                        forInfoDictionaryKey: "BASE_URL"
                    ) as? String {
                        print("BASE_URL: https://\(baseURL)")
                    } else {
                        print("BASE_URL not found")
                    }

                    // ANALYTICS FLAG
                    if let analytics = Bundle.main.object(
                        forInfoDictionaryKey: "MY_ANALYTICS_ENABLED"
                    ) as? String {
                        print("MY_ANALYTICS_ENABLED: \(analytics)")
                    } else {
                        print("MY_ANALYTICS_ENABLED not found")
                    }

                    // CONFIGURATION
                    if let config = Bundle.main.object(
                        forInfoDictionaryKey: "Configuration"
                    ) as? String {
                        print("CONFIGURATION: \(config)")
                    } else {
                        print("Configuration not found")
                    }
                }
        }
    }
}

#Preview {
    RootView()
}

