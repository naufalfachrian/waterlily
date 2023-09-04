import Fluent
import Vapor

struct CreateYouTubeMetric: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("youtube_metrics")
            .id()
            .field("account_id", .string, .required)
            .field("subscribers_count", .int, .required)
            .field("videos_count", .int, .required)
            .field("views_count", .int, .required)
            .field("created_at", .datetime, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("youtube_metrics").delete()
    }
}
