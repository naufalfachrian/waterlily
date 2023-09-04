import Vapor
import Fluent

final class TwitterMetric: Model {
    static let schema = "twitter_metrics"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "followers_count")
    var followersCount: Int

    @Field(key: "followings_count")
    var followingsCount: Int

    @Field(key: "medias_count")
    var mediasCount: Int

    @Field(key: "tweets_count")
    var tweetsCount: Int

    @Field(key: "favorites_count")
    var favoritesCount: Int

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, followersCount: Int, followingsCount: Int, mediasCount: Int, tweetsCount: Int, favoritesCount: Int) {
        self.id = id
        self.accountID = accountID
        self.followersCount = followersCount
        self.followingsCount = followingsCount
        self.mediasCount = mediasCount
        self.tweetsCount = tweetsCount
        self.favoritesCount = favoritesCount
    }
}
