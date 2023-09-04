import Fluent
import Vapor

struct CreateInstagramMetric: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("instagram_metrics")
            .id()
            .field("account_id", .string, .required)
            .field("followers_count", .int, .required)
            .field("followings_count", .int, .required)
            .field("posts_count", .int, .required)
            .field("created_at", .datetime, .required)
            .unique(on: "account_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("instagram_metrics").delete()
    }
}
