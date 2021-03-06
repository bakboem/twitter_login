import 'package:twitter_login/src/utils.dart';

class User {
  /// user email address
  final String _email;

  /// user profile image
  final String _thumbnailImage;

  /// user name
  final String _name;

  /// user name
  final String _screenName;

  /// email address
  String get email => _email;

  /// thumbnailImage
  String get thumbnailImage => _thumbnailImage;

  /// Twitter account name
  String get name => _name;

  /// Twitter account id
  String get screenName => _screenName;

  /// constractor
  User._(Map<String, dynamic> params)
      : this._email = params['email'],
        this._thumbnailImage = params['profile_image_url_https'],
        this._name = params['name'],
        this._screenName = params['screen_name'];

  /// get user info
  static Future<User> getUserData(
    String apiKey,
    String apiSecretKey,
    String accessToken,
    String accessTokenSecret,
  ) async {
    try {
      final authParams = requestHeader(
        apiKey: apiKey,
        oauthToken: accessToken,
      );
      final params = await httpGet(
        ACCOUNT_VERIFY_URI,
        authParams,
        apiKey,
        apiSecretKey,
        accessTokenSecret,
      );
      return User._(params);
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}
