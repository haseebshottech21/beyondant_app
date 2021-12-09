class UserViewModel {
  String userId;
  String userFirstName;
  String userLastName;
  String userUsername;
  String userEmail;
  bool userIsActive;
  String userProfilePic;
  String userCreateAt;
  // String userCoverPic;

  UserViewModel({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userUsername,
    required this.userEmail,
    required this.userIsActive,
    required this.userProfilePic,
    required this.userCreateAt,
    // required this.userCoverPic,
  });

  factory UserViewModel.fromMap(Map<String, dynamic> user) => UserViewModel(
        userId: user['user_id'].toString(),
        userFirstName: user['user_first_name'].toString(),
        userLastName: user['user_last_name'].toString(),
        userUsername: user['user_username'].toString(),
        userEmail: user['user_email'].toString(),
        userIsActive: user['user_is_active'],
        userProfilePic: user['user_profile_picture'].toString(),
        userCreateAt: user['user_created_at'].toString(),
      );
}
