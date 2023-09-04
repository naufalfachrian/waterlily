import Vapor
import Fluent

final class TikTokGroup: Model {
    static let schema = "tiktok_groups"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Parent(key: "group_id")
    var group: Group

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, groupID: UUID) {
        self.id = id
        self.accountID = accountID
        self.$group.id = groupID
    }
}
