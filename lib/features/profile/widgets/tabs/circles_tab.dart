import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:picnic_app/core/domain/model/circle.dart';
import 'package:picnic_app/core/domain/model/paginated_list.dart';
import 'package:picnic_app/features/chat/domain/model/id.dart';
import 'package:picnic_app/features/profile/widgets/circle_action.dart';
import 'package:picnic_app/localization/app_localizations_utils.dart';
import 'package:picnic_app/resources/assets.gen.dart';
import 'package:picnic_app/ui/widgets/paging_list/load_more_scroll_notification.dart';
import 'package:picnic_app/ui/widgets/picnic_circle_avatar.dart';
import 'package:picnic_app/ui/widgets/picnic_list_item.dart';
import 'package:picnic_ui_components/ui/theme/picnic_theme.dart';
import 'package:picnic_ui_components/ui/widgets/picnic_loading_indicator.dart';

class CirclesTab extends StatelessWidget {
  const CirclesTab({
    Key? key,
    required this.userCircles,
    required this.onTapEnterCircle,
    required this.loadMore,
    required this.isLoading,
    this.onLongPress,
    this.onCreateNewCircleTap,
    this.isMe = false,
    required this.onDiscoverNewCircleTap,
  }) : super(key: key);

  final PaginatedList<Circle> userCircles;
  final Function(Id) onTapEnterCircle;
  final Future<void> Function() loadMore;
  final bool isLoading;
  final VoidCallback? onCreateNewCircleTap;
  final VoidCallback onDiscoverNewCircleTap;
  final void Function(Circle circle)? onLongPress;

  final bool isMe;

  static const _searchIconWidth = 18.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LoadMoreScrollNotification(
        emptyItems: userCircles.items.isEmpty,
        hasMore: userCircles.hasNextPage,
        loadMore: loadMore,
        builder: (context) {
          return CustomScrollView(
            slivers: [
              if (isMe)
                SliverToBoxAdapter(
                  child: CircleAction(
                    onTap: onCreateNewCircleTap,
                    title: appLocalizations.createNewCircle,
                    trailing: Assets.images.add.image(),
                  ),
                ),
              SliverToBoxAdapter(
                child: CircleAction(
                  onTap: onDiscoverNewCircleTap,
                  title: appLocalizations.discoverNewCircle,
                  trailing: Assets.images.searchChat.image(width: _searchIconWidth),
                ),
              ),
              _CirclesList(
                onTapEnterCircle: onTapEnterCircle,
                userCircles: userCircles,
                onLongPress: onLongPress,
              ),
              const SliverToBoxAdapter(
                child: Gap(8),
              ),
              const SliverToBoxAdapter(
                child: Gap(8),
              ),
              if (isLoading)
                const SliverFillRemaining(
                  child: Center(
                    child: PicnicLoadingIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _CirclesList extends StatelessWidget {
  const _CirclesList({
    Key? key,
    required this.userCircles,
    required this.onTapEnterCircle,
    this.onLongPress,
  }) : super(key: key);

  final PaginatedList<Circle> userCircles;
  final Function(Id) onTapEnterCircle;
  final void Function(Circle circle)? onLongPress;

  static const double _subtitleOpacity = 0.4;
  static const double _userCircleIconSize = 42;
  static const double _circleBorderRadius = 16.0;
  static const _emojiSize = 22.0;

  @override
  Widget build(BuildContext context) {
    final picnicTheme = PicnicTheme.of(context);

    final colors = picnicTheme.colors;
    final textTheme = picnicTheme.styles;

    final shade900 = colors.blackAndWhite.shade900;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index < userCircles.items.length) {
            final circle = userCircles.items[index];
            return Padding(
              padding: const EdgeInsets.only(
                left: 4,
                right: 4,
                bottom: 8.0,
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: PicnicListItem(
                      borderRadius: _circleBorderRadius,
                      borderColor: circle.isRoyalty ? colors.yellow : null,
                      title: circle.name,
                      titleTextOverflow: TextOverflow.ellipsis,
                      titleStyle: textTheme.title30.copyWith(
                        color: shade900,
                      ),
                      subTitle: appLocalizations.membersCount(circle.membersCount),
                      subTitleStyle: textTheme.caption20.copyWith(
                        color: shade900.withOpacity(_subtitleOpacity),
                      ),
                      leading: PicnicCircleAvatar(
                        emoji: circle.emoji,
                        image: circle.imageFile,
                        avatarSize: _userCircleIconSize,
                        emojiSize: _emojiSize,
                        bgColor: colors.blackAndWhite.shade200,
                      ),
                      trailing: Text(
                        circle.mainRole?.name ?? '',
                        style: textTheme.title30.copyWith(
                          color: circle.formattedMainRoleColor.color,
                        ),
                      ),
                      fillColor: colors.blackAndWhite.shade100,
                      setBoxShadow: true,
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      borderRadius: BorderRadius.circular(_circleBorderRadius),
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: () => onTapEnterCircle(circle.id),
                        onLongPress: () => onLongPress?.call(circle),
                        borderRadius: BorderRadius.circular(_circleBorderRadius),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
        childCount: userCircles.items.length,
      ),
    );
  }
}
