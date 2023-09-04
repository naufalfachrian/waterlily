import Vapor
import Fluent

final class TwitchAccount: Model {
    static let schema = "twitch_accounts"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "username")
    var username: String

    @Field(key: "title")
    var title: String

    @Field(key: "profile_image_url")
    var profileImageURL: String?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, username: String, title: String, profileImageURL: String? = nil) {
        self.id = id
        self.accountID = accountID
        self.username = username
        self.title = title
        self.profileImageURL = profileImageURL
    }
}
