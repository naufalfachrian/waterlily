import Vapor
import Fluent

final class InstagramCreator: Model {
    static let schema = "instagram_creators"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "creator_id")
    var creatorID: UUID

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, creatorID: UUID) {
        self.id = id
        self.accountID = accountID
        self.creatorID = creatorID
    }
}
