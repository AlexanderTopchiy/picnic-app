enum AnalyticsTapTarget {
  onboardingGetStartedButton('onboarding_get_started_button'),
  onboardingLoginButton('onboarding_login_button'),
  onboardingCountryContinueButton('onboarding_country_continue_button'),
  onboardingLanguageContinueButton('onboarding_language_continue_button'),
  onboardingLanguageSelectButton('onboarding_language_select_button'),
  onboardingAgeContinueButton('onboarding_age_continue_button'),
  onboardingPhoneContinueButton('onboarding_phone_continue_button'),
  onboardingSignUpApple('onboarding_sign_up_apple'),
  onboardingSignUpDiscord('onboarding_sign_up_discord'),
  onboardingSignUpGoogle('onboarding_sign_up_google'),
  onboardingUsernameContinueButton('onboarding_username_continue_button'),
  onboardingPhotoAddButton('onboarding_photo_add_button'),
  onboardingPhotoSkipButton('onboarding_photo_skip_button'),
  onboardingPhotoChangeButton('onboarding_photo_change_button'),
  onboardingPhotoContinueButton('onboarding_photo_continue_button'),
  onboardingWelcomeContinueButton('onboarding_welcome_continue_button'),
  onboardingCirclesConfirmButton('onboarding_circles_confirm_button'),
  onboardingNotificationsPermissionButton('onboarding_notifications_permission_button'),
  onboardingContactsPermissionButton('onboarding_contacts_permission_button'),
  onboardingSkipPermissionButton('onboarding_skip_permission_button'),

  postJoinCircleButton('post_join_circle_button'),
  postFollowUserButton('post_follow_user_button'),
  postLikeButton('post_like_button'),
  postDislikeButton('post_dislike_button'),
  postLikeDoubleTap('post_like_double_tap'),
  postSendCommentButton('post_send_comment_button'),
  postOpenChatButton('post_open_chat_button'),
  postBookmarkButton('post_bookmark_button'),
  postShareButton('post_share_button'),
  postReportLongTap('post_report_long_tap'),
  postUserTap('post_user_tap'),
  postCircleTap('post_circle_tap'),
  postCommentsSendCommentButton('post_comments_send_comment_button'),
  postCommentsReplyButton('post_comments_reply_button'),
  postCommentsLikeButton('post_comments_like_button'),

  chatDmsListTap('chat_dms_list_tap'),
  chatDmsNewMassageTap('chat_dms_new_message_tap'),
  chatSendButton('chat_send_button'),
  chatAttachmentButton('chat_attachment_button'),
  chatMessageLikeDoubleTap('chat_message_like_double_tap'),
  chatMessageReactTap('chat_message_react_tap'),
  chatMessageMenuTap('chat_message_menu_tap'),
  chatMessageDeleteTap('chat_message_delete_tap'),
  chatSettingsTap('chat_settings_tap'),
  chatSettingsCircleTap('chat_settings_circle_tap'),
  chatSettingsShareButton('chat_settings_share_button'),
  chatSettingsReportButton('chat_settings_report_button'),
  chatSettingsMuteButton('chat_settings_mute_button'),
  chatSettingsUnmuteButton('chat_settings_unmute_button'),
  chatSettingsGlitterbombButton('chat_settings_glitterbomb_button'),
  chatSettingsJoinButton('chat_settings_join_button'),
  chatSettingsLeaveButton('chat_settings_leave_button'),
  chatSettingsCloseButton('chat_settings_close_button'),
  chatFeedCircleTap('chat_feed_circle_tap'),
  chatFeedChatTap('chat_feed_chat_tap'),
  chatFeedPullToRefresh('chat_feed_pull_to_refresh'),

  profileSettingsButton('profile_settings_button'),
  profileNotificationsButton('profile_notifications_button'),
  profileFollowersTap('profile_followers_tap'),
  profileEditButton('profile_edit_button'),
  profileSavedPostsButton('profile_saved_posts_button'),
  profileViewSeedsTap('profile_view_seeds_tap'),
  profileAddFriendsTap('profile_add_friends_tap'),
  profileOpenPostTap('profile_open_post_tap'),
  profileOpenCircleTap('profile_open_circle_tap'),
  profileCreateNewCircleTap('profile_create_new_circle_tap'),
  profileOptionsButton('profile_options_button'),
  profileOptionsShareTap('profile_options_share_tap'),
  profileOptionsReportTap('profile_options_report_tap'),
  profileBlockButton('profile_block_button'),
  profileDmButton('profile_dm_button'),
  profileGlitterbombButton('private_glitterbomb_button'),
  profileFollowButton('profile_follow_button'),
  profileNotificationsListTap('profile_notifications_list_tap'),

  editProfileSaveWithChangesButton('edit_profile_save_with_changes_button'),
  editProfileImageTap('edit_profile_image_tap'),
  settingsLanguageTap('settings_language_tap'),
  settingsLanguageButtonTap('settings_language_button_tap'),
  settingsLanguageInfoTap('settings_language_info_tap'),
  settingsBlockedListTap('settings_blocked_list_tap'),
  settingsBlockedListBlockedStatusOf('settings_blocked_list_block_status_of'),
  settingsNotificationsTap('settings_notifications_tap'),
  settingsNotificationsToggle('settings_notifications_toggle'),
  settingsPrivacyTap('settings_privacy_tap'),
  settingsPrivacyToggle('settings_privacy_toggle'),
  settingsPrivacyDeleteAccountTap('settings_privacy_delete_account_tap'),
  settingsPrivacyDeleteAccountYesTap('settings_privacy_delete_account_yes_tap'),
  settingsPrivacyDeleteAccountNoTap('settings_privacy_delete_account_no_tap'),
  settingsShareProfileTap('settings_share_profile_tap'),
  settingsSignOutTap('settings_sign_out_tap');

  final String value;

  const AnalyticsTapTarget(this.value);
}
