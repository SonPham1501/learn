import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/data/result_model/result_get_photo.dart';
import 'package:learn/data/result_model/result_user.dart';
import 'package:learn/modules/home/bloc/comment_event.dart';
import 'package:learn/modules/home/bloc/comment_state.dart';
import 'package:learn/utils/data/util_data.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentFetchInitial());

  late final List<ResultGetPhotos> _photos;
  late final List<ResultUsers> _users;

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (state is CommentFetchInitial) {
      _photos = await UtilData.getListRepository.getListPhotos(start: 0, limit: 30);
      print(_photos.length);
      //_users = await UtilData.getListRepository.getListUsers();
      yield CommentFetchSuccess(comments: _photos);
    }
  }
}
