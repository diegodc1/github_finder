import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String login;
  final int? id;

  @JsonKey(name: 'node_id')
  final String? nodeId;

  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @JsonKey(name: 'gravatar_id')
  final String? gravatarId;

  final String? url;

  @JsonKey(name: 'html_url')
  final String? htmlUrl;

  @JsonKey(name: 'followers_url')
  final String? followersUrl;

  @JsonKey(name: 'following_url')
  final String? followingUrl;

  @JsonKey(name: 'gists_url')
  final String? gistsUrl;

  @JsonKey(name: 'starred_url')
  final String? starredUrl;

  @JsonKey(name: 'subscriptions_url')
  final String? subscriptionsUrl;

  @JsonKey(name: 'organizations_url')
  final String? organizationsUrl;

  @JsonKey(name: 'repos_url')
  final String? reposUrl;

  @JsonKey(name: 'events_url')
  final String? eventsUrl;

  @JsonKey(name: 'received_events_url')
  final String? receivedEventsUrl;

  final String? type;

  @JsonKey(name: 'user_view_type')
  final String? userViewType;

  @JsonKey(name: 'site_admin')
  final bool? siteAdmin;

  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final bool? hireable;
  final String? bio;

  @JsonKey(name: 'twitter_username')
  final String? twitterUsername;

  @JsonKey(name: 'public_repos')
  final int? publicRepos;

  @JsonKey(name: 'public_gists')
  final int? publicGists;

  final int? followers;
  final int? following;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  User({
    required this.login,
    this.id,
    this.nodeId,
    required this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.userViewType,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
