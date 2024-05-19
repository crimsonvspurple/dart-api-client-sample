import 'package:commons/services/api/constants/cache_duration.dart';
import 'package:commons/services/api/constants/endpoint.dart';
import 'package:commons/services/api/constants/http_method.dart';
import 'package:commons/services/api/constants/service.dart';
import 'package:commons/services/api/requests/api_base_request.dart';

class BlogListRequest extends ApiBaseRequest {
  BlogListRequest(int pageNumber, int pageSize)
      : super(
            service: Service.core,
            endpoint: Endpoint.blog,
            method: HttpMethod.get,
            requireAuth: null,
            hasBody: false,
            cacheDuration: CacheDuration.blogList,
            pageNumber: pageNumber,
            pageSize: pageSize,
            pageSort: "DESC");
}
