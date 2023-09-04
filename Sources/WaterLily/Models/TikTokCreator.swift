import Vapor
import Fluent

final class TikTokCreator: Model {
    static let schema = "tiktok_creators"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Parent(key: "creator_id")
    var creator: Creator

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, creatorID: UUID) {
        self.id = id
        self.accountID = accountID
        self.$creator.id = creatorID
    }
}
