import 'package:flutter_test/flutter_test.dart';
import 'package:picnic_app/features/posts/domain/model/post_contents/image_post_content.dart';
import 'package:picnic_app/features/posts/full_screen_image/full_screen_image_post_initial_params.dart';
import 'package:picnic_app/features/posts/full_screen_image/full_screen_image_post_presentation_model.dart';
import 'package:picnic_app/features/posts/full_screen_image/full_screen_image_post_presenter.dart';

import '../mocks/posts_mock_definitions.dart';

void main() {
  late FullScreenImagePostPresentationModel model;
  late FullScreenImagePostPresenter presenter;
  late MockFullScreenImagePostNavigator navigator;

  test(
    'sample test',
    () {
      expect(presenter, isNotNull);
    },
  );

  setUp(() {
    model = FullScreenImagePostPresentationModel.initial(
      const FullScreenImagePostInitialParams(imageContent: ImagePostContent.empty()),
    );
    navigator = MockFullScreenImagePostNavigator();
    presenter = FullScreenImagePostPresenter(
      model,
      navigator,
    );
  });
}
