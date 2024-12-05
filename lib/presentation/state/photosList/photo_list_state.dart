part of 'photo_list_cubit.dart';

abstract class PhotoListState extends Equatable {
  const PhotoListState();

  @override
  List<Object?> get props => [];
}

class PhotoListLoadingState extends PhotoListState {}

class PhotoListLoadedState extends PhotoListState {
  final List<Photo> photosList;

  const PhotoListLoadedState(this.photosList);

  @override
  List<Object?> get props => [photosList];
}

class PhotoListErrorState extends PhotoListState {
  final String errorMessage;

  const PhotoListErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
