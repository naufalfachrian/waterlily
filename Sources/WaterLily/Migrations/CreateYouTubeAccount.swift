import Fluent
import Vapor

struct CreateYouTubeAccount: AsyncMigration {
    func prepare(on database: Database) async throws {
        let youTubeAccountBadgeType = try await database.enum("youtube_account_badge_type")
            .case("official")
            .case("music")
            .create()
        try await database.schema("youtube_accounts")
            .id()
            .field("account_id", .string, .required)
            .field("username", .string, .required)
            .field("title", .string, .required)
            .field("badge", youTubeAccountBadgeType)
            .field("is_membership_enabled", .bool, .required)
            .field("profile_image_url", .string)
            .field("banner_image_url", .string)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "account_id")
            .unique(on: "username")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("youtube_accounts").delete()
    }
}
