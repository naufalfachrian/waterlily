import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)

    app.migrations.add(CreateGroup())
    app.migrations.add(CreateCreator())
    app.migrations.add(CreateCreatorGroup())
    app.migrations.add(CreateYouTubeAccount())
    app.migrations.add(CreateYouTubeMetric())
    app.migrations.add(CreateYouTubeCreator())
    app.migrations.add(CreateYouTubeGroup())
    app.migrations.add(CreateTwitchAccount())
    app.migrations.add(CreateTwitchMetric())
    app.migrations.add(CreateTwitchCreator())
    app.migrations.add(CreateTwitchGroup())
    app.migrations.add(CreateTikTokAccount())
    app.migrations.add(CreateTikTokMetric())
    app.migrations.add(CreateTikTokCreator())
    app.migrations.add(CreateTikTokGroup())
    app.migrations.add(CreateBilibiliAccount())
    app.migrations.add(CreateBilibiliMetric())
    app.migrations.add(CreateBilibiliCreator())
    app.migrations.add(CreateBilibiliGroup())
    app.migrations.add(CreateTwitterAccount())
    app.migrations.add(CreateTwitterMetric())
    app.migrations.add(CreateTwitterCreator())
    app.migrations.add(CreateTwitterGroup())
    app.migrations.add(CreateInstagramAccount())
    app.migrations.add(CreateInstagramMetric())
    app.migrations.add(CreateInstagramCreator())
    app.migrations.add(CreateInstagramGroup())

    // register routes
    try routes(app)
}
