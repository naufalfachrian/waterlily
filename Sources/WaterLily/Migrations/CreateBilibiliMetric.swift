import Fluent
import Vapor

struct CreateBilibiliMetric: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("bilibili_metrics")
            .id()
            .field("account_id", .string, .required)
            .field("followers_count", .int, .required)
            .field("followings_count", .int, .required)
            .field("likes_count", .int, .required)
            .field("created_at", .datetime, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("bilibili_metrics").delete()
    }
}
