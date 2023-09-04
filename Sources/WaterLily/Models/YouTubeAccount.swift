import Vapor
import Fluent

final class YouTubeAccount: Model {
    static let schema = "youtube_accounts"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "username")
    var username: String

    @Field(key: "title")
    var title: String

    enum Badge: String, Codable {
        case official = "official"
        case music = "music"
    }

    @Field(key: "badge")
    var badge: Badge?

    @Field(key: "is_membership_enabled")
    var isMembershipEnabled: Bool

    @Field(key: "profile_image_url")
    var profileImageURL: String?

    @Field(key: "banner_image_url")
    var bannerImageURL: String?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, username: String, title: String, badge: Badge? = nil, isMembershipEnabled: Bool, profileImageURL: String? = nil, bannerImageURL: String? = nil) {
        self.id = id
        self.accountID = accountID
        self.username = username
        self.title = title
        self.badge = badge
        self.isMembershipEnabled = isMembershipEnabled
        self.profileImageURL = profileImageURL
        self.bannerImageURL = bannerImageURL
    }
}
