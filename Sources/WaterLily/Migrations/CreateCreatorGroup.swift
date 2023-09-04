import Fluent
import Vapor

struct CreateCreatorGroup: AsyncMigration {
    func prepare(on database: Database) async throws {
        let creatorGroupStatusType = try await database.enum("creator_group_status_type")
            .case("active")
            .case("left")
            .create()
        try await database.schema("creators_groups")
            .id()
            .field("creator_id", .uuid, .required, .references("creators", "id", onDelete: .cascade))
            .field("group_id", .uuid, .required, .references("groups", "id", onDelete: .cascade))
            .field("status", creatorGroupStatusType, .required)
            .field("join_date", .date)
            .field("left_date", .date)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("creators_groups").delete()
    }
}
