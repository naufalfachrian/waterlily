import Fluent
import Vapor

struct CreateTwitterMetric: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("twitter_metrics")
            .id()
            .field("account_id", .string, .required)
            .field("followers_count", .int, .required)
            .field("followings_count", .int, .required)
            .field("medias_count", .int, .required)
            .field("tweets_count", .int, .required)
            .field("favorites_count", .int, .required)
            .field("created_at", .datetime, .required)
            .unique(on: "account_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("twitter_metrics").delete()
    }
}
