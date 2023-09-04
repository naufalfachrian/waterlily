import Fluent
import Vapor

struct CreateTwitchMetric: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("twitch_metrics")
            .id()
            .field("account_id", .string, .required)
            .field("followers_count", .int, .required)
            .field("created_at", .datetime, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("twitch_metrics").delete()
    }
}
