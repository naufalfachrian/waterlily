import Vapor
import Fluent

final class Creator: Model {
    static let schema = "creators"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "persona")
    var persona: String?

    @Field(key: "profile_image_url")
    var profileImageURL: String?

    @Field(key: "banner_image_url")
    var bannerImageURL: String?

    @Field(key: "birth_place")
    var birthPlace: String?

    @Field(key: "birth_date")
    var birthDate: Date?

    @Field(key: "debut_date")
    var debutDate: Date?

    enum Status: String, Codable {
        case active = "active"
        case inactive = "inactive"
        case onBreak = "on_break"
        case graduated = "graduated"
        case terminated = "terminated"
        case removed = "removed"
    }

    @Enum(key: "status")
    var status: Status

    enum ContentRating: String, Codable {
        case undefined = "undefined"
        case generalAudience = "general_audience"
        case teenagerAudience = "teenager_audience"
        case matureAudience = "mature_audience"
    }

    @Enum(key: "content_rating")
    var contentRating: ContentRating

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, name: String, persona: String? = nil, profileImageURL: String? = nil, bannerImageURL: String? = nil, birthPlace: String? = nil, birthDate: Date? = nil, debutDate: Date? = nil, status: Status = .active, contentRating: ContentRating = .undefined) {
        self.id = id
        self.name = name
        self.persona = persona
        self.profileImageURL = profileImageURL
        self.bannerImageURL = bannerImageURL
        self.birthPlace = birthPlace
        self.birthDate = birthDate
        self.debutDate = debutDate
        self.status = status
        self.contentRating = contentRating
    }
}
