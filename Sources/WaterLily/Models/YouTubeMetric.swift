import Vapor
import Fluent

final class YouTubeMetric: Model {
    static let schema = "youtube_metrics"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "subscribers_count")
    var subscribersCount: Int

    @Field(key: "videos_count")
    var videosCount: Int

    @Field(key: "views_count")
    var viewsCount: Int

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, subscribersCount: Int, videosCount: Int, viewsCount: Int) {
        self.id = id
        self.accountID = accountID
        self.subscribersCount = subscribersCount
        self.videosCount = videosCount
        self.viewsCount = viewsCount
    }
}
