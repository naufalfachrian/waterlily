import Fluent
import Vapor

struct CreateCreator: AsyncMigration {
    func prepare(on database: Database) async throws {
        let creatorStatusType = try await database.enum("creator_status_type")
            .case("active")
            .case("inactive")
            .case("on_break")
            .case("graduated")
            .case("terminated")
            .case("removed")
            .create()
        let creatorContentRatingType = try await database.enum("creator_content_rating_type")
            .case("undefined")
            .case("general_audience")
            .case("teenager_audience")
            .case("mature_audience")
            .create()
        try await database.schema("creators")
            .id()
            .field("name", .string, .required)
            .field("persona", .string)
            .field("profile_image_url", .string)
            .field("banner_image_url", .string)
            .field("birth_place", .string)
            .field("birth_date", .date)
            .field("debut_date", .date)
            .field("status", creatorStatusType, .required)
            .field("content_rating", creatorContentRatingType, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "name")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("creators").delete()
    }
}
