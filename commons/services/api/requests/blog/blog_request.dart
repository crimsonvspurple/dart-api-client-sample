import 'package:commons/services/api/constants/cache_duration.dart';
import 'package:commons/services/api/constants/endpoint.dart';
import 'package:commons/services/api/constants/http_method.dart';
import 'package:commons/services/api/constants/service.dart';
import 'package:commons/services/api/requests/api_base_request.dart';

class BlogRequest extends ApiBaseRequest {
  BlogRequest(String id)
      : super(
          service: Service.core,
          endpoint: Endpoint.blog,
          method: HttpMethod.get,
          requireAuth: false,
          hasBody: false,
          cacheDuration: CacheDuration.blogSingle,
          path: '/$id',
        );
}
