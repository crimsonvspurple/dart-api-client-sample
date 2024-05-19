enum App { gp, dn }

enum AppPlatform { web, android, ios, fuchsia, linux, macos, windows }

enum SortBy { POINT, HOT, COLD, createdAt, fantasyPoints, currentPrice, basePrice, position, fullName, playerId }

enum SortOrder { ASC, DESC }

enum Period { YESTERDAY, SEASON }

enum SeasonType { REGULAR, PLAYOFF }

enum SeasonStatus { SCHEDULED, ONGOING, ENDED }

enum LeagueStatus { PENDING, ONGOING, COMPLETE }

enum NoticeType { WARNING, INFO, ERROR, SUCCESS }

enum FeedbackType { GENERAL, FEATURE_REQUEST, BUG_REPORT, QUERY }

enum DeleteStatuses { NOT_REQUESTED, PENDING, DELETED }
