import 'package:dio/dio.dart';
import 'package:learn/core/constants/api_path.dart';
import 'package:learn/data/http/api.dart';
import 'package:learn/data/http/request_response.dart';
import 'package:learn/data/result_model/result_get_comment.dart';

class GetListRepository {
  Future<List<ResultGetComment>> getListComments({required int start, required int limit}) async {
    late final List<ResultGetComment> comments = [];

    Map<String, dynamic> body = {
      '_start': start,
      '_limit': limit,
    };

    RequestResponse res = await httpManager.fetch(ApiPath.COMMENTS, body, null);
    if (res.result) {
      comments.addAll(resultGetCommentFromJson(res.data));
    } else {
      if (res.code != 200) print('Error');
    }

    return comments;
  }

  Future getListPhotos({required int start, required int limit}) async{


  }
}
