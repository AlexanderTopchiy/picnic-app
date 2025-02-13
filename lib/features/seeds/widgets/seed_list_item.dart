import 'package:flutter/material.dart';
import 'package:picnic_app/features/seeds/domain/model/seed.dart';
import 'package:picnic_app/ui/widgets/default_avatar.dart';
import 'package:picnic_app/ui/widgets/picnic_circle_avatar.dart';
import 'package:picnic_app/ui/widgets/picnic_list_item.dart';
import 'package:picnic_ui_components/ui/theme/picnic_theme.dart';

class SeedListItem extends StatelessWidget {
  const SeedListItem({
    Key? key,
    required this.seed,
    this.trailing,
    this.subTitle,
    this.padding = _padding,
    this.onTapOpenCircle,
    required this.title,
  }) : super(key: key);

  final Seed seed;
  final Widget? trailing;
  final String? subTitle;
  final EdgeInsets padding;
  final VoidCallback? onTapOpenCircle;
  final String title;

  static const _avatarSize = 40.0;
  static const _emojiSize = 24.0;
  static const _trailingGap = 8.0;

  static const double _circleBorderRadius = 16.0;

  static const _padding = EdgeInsets.symmetric(horizontal: 24, vertical: 8.0);

  @override
  Widget build(BuildContext context) {
    final theme = PicnicTheme.of(context);
    final styles = theme.styles;
    final colors = theme.colors;

    final _picnicAvatar = PicnicCircleAvatar(
      emoji: seed.circleEmoji,
      image: seed.circleImage,
      avatarSize: _avatarSize,
      emojiSize: _emojiSize,
      bgColor: colors.blackAndWhite.shade200,
      placeholder: DefaultAvatar.seed(),
    );

    return Padding(
      padding: padding,
      child: PicnicListItem(
        borderRadius: _circleBorderRadius,
        setBoxShadow: true,
        fillColor: colors.blackAndWhite.shade100,
        leading: _picnicAvatar,
        title: title,
        subTitle: subTitle,
        subtitleTextOverflow: TextOverflow.ellipsis,
        subTitleStyle: subTitle != null ? styles.caption20.copyWith(color: colors.blackAndWhite.shade500) : null,
        titleStyle: styles.title30,
        onTap: onTapOpenCircle,
        trailingGap: _trailingGap,
        trailing: trailing,
      ),
    );
  }
}
