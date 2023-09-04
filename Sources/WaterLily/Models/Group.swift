import Vapor
import Fluent

final class Group: Model {
    static let schema = "groups"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "logo_image_url")
    var logoImageURL: String?

    @Field(key: "banner_image_url")
    var bannerImageURL: String?

    @Field(key: "official_website_url")
    var officialWebsiteURL: String?

    enum Status: String, Codable {
        case active = "active"
        case inactive = "inactive"
        case disbanded = "disbanded"
        case merged = "merged"
        case removed = "removed"
    }

    @Enum(key: "status")
    var status: Status

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, name: String, logoImageURL: String? = nil, bannerImageURL: String? = nil, officialWebsiteURL: String? = nil, status: Status = .active) {
        self.id = id
        self.name = name
        self.logoImageURL = logoImageURL
        self.bannerImageURL = bannerImageURL
        self.officialWebsiteURL = officialWebsiteURL
        self.status = status
    }
}
