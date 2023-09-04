import Fluent
import Vapor

struct CreateBilibiliAccount: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("bilibili_accounts")
            .id()
            .field("account_id", .string, .required)
            .field("title", .string, .required)
            .field("is_verified", .bool, .required)
            .field("profile_image_url", .string)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .unique(on: "account_id")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("bilibili_accounts").delete()
    }
}
