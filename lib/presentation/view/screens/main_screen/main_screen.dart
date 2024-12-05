import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_tech_task/core/constants/app_strings.dart';
import 'package:lanars_tech_task/core/theme/app_text_styles.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';
import 'package:lanars_tech_task/data/models/pexels_api_model.dart';
import 'package:lanars_tech_task/presentation/state/photosList/photo_list_cubit.dart';
import 'package:lanars_tech_task/presentation/view/screens/drawer_menu/drawer_menu_screen.dart';
import 'package:lanars_tech_task/presentation/view/screens/main_screen/widgets/list_item_widget.dart';
import 'package:lanars_tech_task/presentation/view/screens/search_screen/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController _bodyAnimationController;
  late Animation<Offset> _bodyAnimation;

  @override
  void initState() {
    super.initState();

    _bodyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _bodyAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _bodyAnimationController,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      _bodyAnimationController.forward();
    });

    context.read<PhotoListCubit>().fetchPhotosListData();
  }

  @override
  void dispose() {
    _bodyAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          AppStrings.listPage,
          style: AppTextStyles.mediumBodyText.copyWith(
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(CupertinoIcons.bars),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            ),
          ),
        ],
      ),
      body: BlocBuilder<PhotoListCubit, PhotoListState>(
        builder: (context, state) {
          if (state is PhotoListLoadedState) {
            final photoList = state.photosList;

            final groupedPhotos = _groupPhotos(photoList);

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<PhotoListCubit>().fetchPhotosListData();
              },
              child: SlideTransition(
                position: _bodyAnimation,
                child: ListView.builder(
                  itemCount: groupedPhotos.length,
                  itemBuilder: (context, index) {
                    final group = groupedPhotos[index];
                    final letter = group['letter'];
                    final photos = group['photos'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            letter,
                            style: AppTextStyles.mediumBodyText.copyWith(
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ),
                        ...photos
                            .map(
                              (photo) => ListItemWidget(
                                photo: photo,
                              ),
                            )
                            .toList(),
                      ],
                    );
                  },
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: const DrawerMenuScreen(),
      ),
    );
  }

  List<Map<String, dynamic>> _groupPhotos(List<Photo> photos) {
    final List<Map<String, dynamic>> groupedPhotos = [];
    String? currentLetter;

    for (final photo in photos) {
      final firstLetter = photo.photographer[0].toUpperCase();

      if (currentLetter != firstLetter) {
        currentLetter = firstLetter;
        groupedPhotos.add({
          'letter': currentLetter,
          'photos': [photo],
        });
      } else {
        groupedPhotos.last['photos'].add(photo);
      }
    }

    return groupedPhotos;
  }
}
