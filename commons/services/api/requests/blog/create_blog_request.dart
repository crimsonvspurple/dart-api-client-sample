import 'package:commons/services/api/constants/service.dart';
import 'package:commons/services/api/constants/endpoint.dart';
import 'package:commons/services/api/constants/http_method.dart';
import 'package:commons/services/api/requests/api_base_request.dart';
import 'package:commons/services/api/requests/blog/create_blog_body.dart';

class CreateBlogRequest extends ApiBaseRequest {
  CreateBlogRequest(CreateBlogBody createBlogBody)
      : super(
          service: Service.core,
          endpoint: Endpoint.blog,
          method: HttpMethod.post,
          requireAuth: true,
          hasBody: true,
        ) {
    body = createBlogBody;
  }
}
