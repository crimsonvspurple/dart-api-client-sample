import 'package:commons/services/api/collections/base_api_service.dart';
import 'package:commons/services/api/requests/blog/blog_list_request.dart';
import 'package:commons/services/api/requests/blog/blog_request.dart';
import 'package:commons/services/api/requests/blog/blog_update_request.dart';
import 'package:commons/services/api/requests/blog/create_blog_body.dart';
import 'package:commons/services/api/requests/blog/create_blog_request.dart';
import 'package:commons/services/api/responses/api_response.dart';
import 'package:commons/services/api/responses/blog/blog.dart';
import 'package:commons/services/api/responses/page.dart';

import '../requests/blog/update_blog_body.dart';

class BlogService extends BaseApiService {
  Future<Page> getBlogList({int pageNumber = 0, int pageSize = 10}) async {
    ApiResponse apiResponse = await apiClient.call(BlogListRequest(pageNumber, pageSize));
    Page page = Page.fromJson(apiResponse.data!);
    return page;
  }

  Future<Blog> getBlogById(String id) async {
    ApiResponse apiResponse = await apiClient.call(BlogRequest(id));
    return Blog.fromJson(apiResponse.data!);
  }

  Future<Blog> createBlog(CreateBlogBody createBlogBody) async {
    ApiResponse apiResponse = await apiClient.call(CreateBlogRequest(createBlogBody));
    Blog createBlog = Blog.fromJson(apiResponse.data!);
    return createBlog;
  }

  Future<Blog> updateBlog(UpdateBlogBody updateBlogBody) async {
    ApiResponse apiResponse = await apiClient.call(BlogUpdateRequest(updateBlogBody));
    Blog updateBlog = Blog.fromJson(apiResponse.data!);
    // since we just updated this item, we need to bust the cache for this item
    await apiClient.bustCache(BlogRequest(updateBlog.id).getHash());
    return updateBlog;
  }
}
