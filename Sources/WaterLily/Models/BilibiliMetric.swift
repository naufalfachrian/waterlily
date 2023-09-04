import Vapor
import Fluent

final class BilibiliMetric: Model {
    static let schema = "bilibili_metrics"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "followers_count")
    var followersCount: Int

    @Field(key: "followings_count")
    var followingsCount: Int

    @Field(key: "likes_count")
    var likesCount: Int

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, followersCount: Int, followingsCount: Int, likesCount: Int) {
        self.id = id
        self.accountID = accountID
        self.followersCount = followersCount
        self.followingsCount = followingsCount
        self.likesCount = likesCount
    }
}
