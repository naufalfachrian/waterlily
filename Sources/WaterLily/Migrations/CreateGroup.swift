import Fluent
import Vapor

struct CreateGroup: AsyncMigration {
    func prepare(on database: Database) async throws {
        let groupStatusType = try await database.enum("group_status_type")
            .case("active")
            .case("inactive")
            .case("disbanded")
            .case("merged")
            .case("removed")
            .create()
        try await database.schema("groups")
            .id()
            .field("name", .string, .required)
            .field("logo_image_url", .string)
            .field("banner_image_url", .string)
            .field("official_website_url", .string)
            .field("status", groupStatusType, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "name")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("groups").delete()
    }
}
