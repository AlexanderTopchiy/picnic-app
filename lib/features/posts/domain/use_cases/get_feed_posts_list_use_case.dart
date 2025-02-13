import 'package:picnic_app/core/domain/model/cache_policy.dart';
import 'package:picnic_app/core/domain/model/cacheable_result.dart';
import 'package:picnic_app/core/domain/model/cursor.dart';
import 'package:picnic_app/core/domain/model/paginated_list.dart';
import 'package:picnic_app/features/chat/domain/model/id.dart';
import 'package:picnic_app/features/posts/domain/model/get_feed_posts_list_failure.dart';
import 'package:picnic_app/features/posts/domain/model/posts/post.dart';
import 'package:picnic_app/features/posts/domain/repositories/posts_repository.dart';

class GetFeedPostsListUseCase {
  const GetFeedPostsListUseCase(this._postsRepository);

  final PostsRepository _postsRepository;

  Stream<CacheableResult<GetFeedPostsListFailure, PaginatedList<Post>>> execute({
    required Id feedId,
    required String searchQuery,
    required Cursor cursor,
    CachePolicy? cachePolicy,
  }) {
    return _postsRepository
        .getFeedPosts(
          feedId: feedId,
          searchQuery: searchQuery,
          cursor: cursor,
          //by default lets only cache first page, while other pages will not be cached at all
          cachePolicy: cachePolicy ?? (cursor.isFirstPage ? CachePolicy.cacheAndNetwork : CachePolicy.networkOnly),
        )
        .mapFailure(GetFeedPostsListFailure.unknown);
  }
}
