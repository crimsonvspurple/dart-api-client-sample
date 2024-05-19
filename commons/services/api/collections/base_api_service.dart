import 'package:commons/services/api/api_client.dart';
import 'package:commons/services/api/constants/message.dart';
import 'package:commons/services/api/responses/api_response.dart';

abstract class BaseApiService {
  final ApiClient apiClient = ApiClient();
  // final HiveClient hiveClient = HiveClient();

  ApiResponse generateApiResponse(List items) {
    Map<String, dynamic> page = {
      "content": items,
      "pageable": {
        "sort": {"sorted": true, "unsorted": false, "empty": false},
        "pageSize": 9,
        "pageNumber": 0,
        "offset": 0,
        "paged": true,
        "unpaged": false
      },
      "totalPages": 100,
      "totalElements": 1000,
      "last": false,
      "first": true,
      "sort": {"sorted": true, "unsorted": false, "empty": false},
      "number": 0,
      "numberOfElements": 9,
      "size": 9,
      "empty": false
    };

    return ApiResponse(Message.SUCCESS, [], page, 1, DateTime.now().millisecondsSinceEpoch);
  }
}
