class TokenObj {
  TokenObj({this.accessToken = '', this.refreshToken = ''});

  String? accessToken;
  String? refreshToken;

  factory TokenObj.fromJson(Map<String, dynamic> json) => TokenObj(
      accessToken: json['accessToken'], refreshToken: json['refreshToken']);

  Map<String, dynamic> toJson() => _$TokenObjToJson(this);

  Map<String, dynamic> _$TokenObjToJson(TokenObj instance) => {
        'accessToken': instance.accessToken,
        'refreshToken': instance.refreshToken,
      };
}
