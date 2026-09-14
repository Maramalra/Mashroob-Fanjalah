import SwiftUI
import SwiftData

@main
struct MyApp: App {
    // Define your ModelContainer with the appropriate schema
    var sharedModelContainer: ModelContainer = {
        // Make sure 'Item' is defined in your project or imported correctly
        let schema = Schema([
            Item.self, // Ensure 'Item' is correctly defined
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            // Ensure 'ContentView' is defined in your project or imported correctly
            ContentView() // If ContentView is in a different module, make sure it is imported
        }
        .modelContainer(sharedModelContainer)
    }
}
