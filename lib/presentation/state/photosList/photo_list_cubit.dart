import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lanars_tech_task/data/models/pexels_api_model.dart';
import 'package:lanars_tech_task/data/repositories/repository_impl/photos_list_repository/photo_list_repository_impl.dart';

part 'photo_list_state.dart';

class PhotoListCubit extends Cubit<PhotoListState> {
  final PhotoListRepository _repository;

  PhotoListCubit(this._repository) : super(PhotoListLoadingState());

  Future<void> fetchPhotosListData() async {
    emit(PhotoListLoadingState());
    try {
      final PexelsResponseModel photosList =
          await _repository.fetchPhotosListData();
      final sortedPhotos = _sortPhotosByPhotographer(photosList.photos);
      emit(PhotoListLoadedState(sortedPhotos));
    } catch (e) {
      developer.log('Error fetching photos: $e');
      emit(PhotoListErrorState(e.toString()));
    }
  }

  List<Photo> _sortPhotosByPhotographer(List<Photo> photos) {
    photos.sort((a, b) => a.photographer.compareTo(b.photographer));
    return photos;
  }
}
