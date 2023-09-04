import Fluent
import Vapor

struct CreateInstagramCreator: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("instagram_creators")
            .id()
            .field("account_id", .string, .required)
            .field("creator_id", .uuid, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "account_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("instagram_creators").delete()
    }
}
