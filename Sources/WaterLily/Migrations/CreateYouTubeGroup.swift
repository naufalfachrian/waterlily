import Fluent
import Vapor

struct CreateYouTubeGroup: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("youtube_groups")
            .id()
            .field("account_id", .string, .required)
            .field("group_id", .uuid, .required, .references("groups", "id", onDelete: .cascade))
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "account_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("youtube_groups").delete()
    }
}
