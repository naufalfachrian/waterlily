import Vapor
import Fluent

final class TikTokMetric: Model {
    static let schema = "tiktok_metrics"

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

    @Field(key: "videos_count")
    var videosCount: Int

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, followersCount: Int, followingsCount: Int, likesCount: Int, videosCount: Int) {
        self.id = id
        self.accountID = accountID
        self.followersCount = followersCount
        self.followingsCount = followingsCount
        self.likesCount = likesCount
        self.videosCount = videosCount
    }
}
