import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_tech_task/core/constants/app_strings.dart';
import 'package:lanars_tech_task/core/theme/app_text_styles.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';
import 'package:lanars_tech_task/presentation/state/photosList/photo_list_cubit.dart';
import 'package:lanars_tech_task/presentation/view/screens/main_screen/main_screen.dart';
import 'package:lanars_tech_task/presentation/view/screens/main_screen/widgets/list_item_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotoListCubit, PhotoListState>(
        builder: (context, state) {
          if (state is PhotoListLoadedState) {
            final allPhotos = state.photosList;
            final filteredPhotos = allPhotos.where((photo) {
              return photo.photographer
                  .toLowerCase()
                  .contains(_searchQuery.toLowerCase());
            }).toList();

            return Column(
              children: [
                const SizedBox(height: 80.0),
                Container(
                  height: 72.0,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: lightColorScheme.secondary,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(CupertinoIcons.arrow_left),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _searchController,
                          onChanged: (query) {
                            setState(() {
                              _searchQuery = query;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: AppStrings.search,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(CupertinoIcons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: filteredPhotos.isEmpty
                      ? Column(
                        children: [
                          const SizedBox(height: 75.0),
                          Text(
                            AppStrings.noItemFound,
                            style: AppTextStyles.h2Text,
                          ),
                        ],
                      )
                      : ListView.builder(
                          itemCount: filteredPhotos.length,
                          itemBuilder: (context, index) {
                            final photo = filteredPhotos[index];
                            return ListItemWidget(
                              photo: photo,
                              isSearchScreen: true,
                            );
                          },
                        ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
