import Fluent
import Vapor

struct CreateTikTokMetric: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("tiktok_metrics")
            .id()
            .field("account_id", .string, .required)
            .field("followers_count", .int, .required)
            .field("followings_count", .int, .required)
            .field("likes_count", .int, .required)
            .field("videos_count", .int, .required)
            .field("created_at", .datetime, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("tiktok_metrics").delete()
    }
}
