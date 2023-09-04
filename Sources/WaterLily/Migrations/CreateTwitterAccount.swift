import Fluent
import Vapor

struct CreateTwitterAccount: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("twitter_accounts")
            .id()
            .field("account_id", .string, .required)
            .field("username", .string, .required)
            .field("title", .string, .required)
            .field("is_verified", .bool, .required)
            .field("profile_image_url", .string)
            .field("banner_image_url", .string)
            .field("is_sensitive", .bool, .required)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "account_id")
            .unique(on: "username")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("twitter_accounts").delete()
    }
}
