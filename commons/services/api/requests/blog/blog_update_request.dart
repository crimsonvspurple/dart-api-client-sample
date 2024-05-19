import 'package:commons/services/api/constants/cache_duration.dart';
import 'package:commons/services/api/constants/endpoint.dart';
import 'package:commons/services/api/constants/http_method.dart';
import 'package:commons/services/api/constants/service.dart';
import 'package:commons/services/api/requests/api_base_request.dart';
import 'package:commons/services/api/requests/blog/update_blog_body.dart';

class BlogUpdateRequest extends ApiBaseRequest {
  BlogUpdateRequest(UpdateBlogBody updateBlogBody)
      : super(
          service: Service.core,
          endpoint: Endpoint.blog,
          method: HttpMethod.put,
          requireAuth: true,
          hasBody: true,
          cacheDuration: CacheDuration.blogUpdate,
        ) {
    body = updateBlogBody;
  }
}
