
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/data/http/request_response.dart';
import 'package:learn/data/result_model/result_get_comment.dart';
import 'package:learn/data/result_model/result_login.dart';
import 'package:learn/modules/home/bloc/comment_event.dart';
import 'package:learn/modules/home/bloc/comment_state.dart';
import 'package:learn/utils/data/util_data.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState>{
  CommentBloc() : super(CommentFetchInitial());

  late final List<ResultGetComment> _comments;

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async*{
    if (state is CommentFetchInitial) {
      // _comments = await UtilData.getListRepository.getListComments(start: 0, limit: 5);
      // print(_comments.length);
      await login(email: 'bomditimvk02@gmail.com', password: '123456');
      yield CommentFetchSuccess(comments: []);
    }
  }


  Future<void> login({required String email, required String password}) async{
    RequestResponse res = await UtilData.candidateRepository.loginCandidate(email: email, password: password);
    if(res.result){
      print(res.data);
      ResultLogin resultLogin = resultLoginFromJson(res.data);
      if(resultLogin.data!.result!){
        UserInfo userInfo = resultLogin.data!.userInfo!;
        print(userInfo.epName);
      }
    }else{
      if(res.code != 200) print('Error');
    }
  }

}