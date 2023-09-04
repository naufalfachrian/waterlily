import Vapor
import Fluent

final class CreatorGroup: Model {
    static let schema = "creators_groups"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "creator_id")
    var creator: Creator

    @Parent(key: "group_id")
    var group: Group

    enum Status: String, Codable {
        case active = "active"
        case left = "left"
    }

    @Field(key: "status")
    var status: Status

    @Field(key: "join_date")
    var joinDate: Date?

    @Field(key: "left_date")
    var leftDate: Date?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, creatorID: UUID, groupID: UUID, status: Status = .active, joinDate: Date? = nil, leftDate: Date? = nil) {
        self.id = id
        self.$creator.id = creatorID
        self.$group.id = groupID
        self.status = status
        self.joinDate = joinDate
        self.leftDate = leftDate
    }
}
