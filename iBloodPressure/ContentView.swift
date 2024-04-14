import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Observable
    class ContentModel {
        var showAddReading = false
    }
    private let modelContext: ModelContext
    
    @State private var contentModel = ContentModel()

    var body: some View {
        NavigationStack {
            ReadingListView()
                .navigationTitle("Blood pressure history")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Add", systemImage: "plus") {
                        contentModel.showAddReading = true
                    }
                }
                .sheet(isPresented: $contentModel.showAddReading, content: {
                    AddReadingView(modelContext: modelContext)
                })
        }.environment(contentModel)
    }

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let modelContainer = try ModelContainer(for: Reading.self, configurations: config)
        return ContentView(modelContext: modelContainer.mainContext).modelContext(modelContainer.mainContext)
    } catch {
        return Text(error.localizedDescription)
    }
}
