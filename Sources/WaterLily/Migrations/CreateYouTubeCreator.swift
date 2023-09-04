import Fluent
import Vapor

struct CreateYouTubeCreator: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("youtube_creators")
            .id()
            .field("account_id", .string, .required)
            .field("creator_id", .uuid, .required, .references("creators", "id", onDelete: .cascade))
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "account_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("youtube_creators").delete()
    }
}
