import 'package:learn/core/constants/api_path.dart';
import 'package:learn/data/http/api.dart';
import 'package:learn/data/http/request_response.dart';
import 'package:learn/data/result_model/result_get_comment.dart';
import 'package:learn/data/result_model/result_get_photo.dart';
import 'package:learn/data/result_model/result_user.dart';

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

  Future<List<ResultGetPhotos>> getListPhotos({required int start, required int limit}) async{
    late final List<ResultGetPhotos> photos = [];
    Map<String, dynamic> body = {
      '_start': start,
      '_limit': limit,
    };

    RequestResponse res = await httpManager.fetch(ApiPath.PHOTO, body, null);
    if(res.result){
      print(res.data);
      photos.addAll(listResultGetPhotoFromJson(res.data));
     try{

     }catch(e){
       //print(e.toString());
     }
    }else{
      if(res.code != 200) print('Error');
    }

    return photos;
  }

  Future<List<ResultUsers>> getListUsers() async{
    late final List<ResultUsers> users = [];
    RequestResponse res = await httpManager.fetch(ApiPath.USER, null, null);
    if(res.result){
      print(res.data);
      users.addAll(resultUsersFromJson(res.data));
      print(users.length);
    }else{
      if(res.code != 200) print('error');
    }

    return users;
  }
}
