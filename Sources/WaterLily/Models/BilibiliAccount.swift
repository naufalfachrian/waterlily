import Vapor
import Fluent

final class BilibiliAccount: Model {
    static let schema = "bilibili_accounts"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "account_id")
    var accountID: String

    @Field(key: "title")
    var title: String

    @Field(key: "is_verified")
    var isVerified: Bool

    @Field(key: "profile_image_url")
    var profileImageURL: String?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, accountID: String, title: String, isVerified: Bool, profileImageURL: String? = nil) {
        self.id = id
        self.accountID = accountID
        self.title = title
        self.isVerified = isVerified
        self.profileImageURL = profileImageURL
    }
}
