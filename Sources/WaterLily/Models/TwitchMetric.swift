import Vapor
import Fluent

final class TwitchMetric: Model {
    static let schema = "twitch_metrics"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "followers_count")
    var followersCount: Int

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, followersCount: Int) {
        self.id = id
        self.accountID = accountID
        self.followersCount = followersCount
    }
}
