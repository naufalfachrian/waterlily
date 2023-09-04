import Vapor
import Fluent

final class InstagramGroup: Model {
    static let schema = "instagram_groups"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "group_id")
    var groupID: UUID

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, groupID: UUID) {
        self.id = id
        self.accountID = accountID
        self.groupID = groupID
    }
}
