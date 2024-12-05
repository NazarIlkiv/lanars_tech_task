import 'package:flutter/material.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';
import 'package:lanars_tech_task/core/utils/string_utils.dart';
import 'package:lanars_tech_task/data/models/pexels_api_model.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    required this.photo,
    this.isSearchScreen = false,
    super.key,
  });

  final Photo photo;
  final bool isSearchScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 4.0,
        bottom: 4.0,
        right: 16.0,
        left: isSearchScreen ? 16.0 : 40.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: lightColorScheme.outlineVariant,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  child: Image.network(
                    photo.src.small,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(photo.photographer),
                subtitle: Text(
                  StringUtils().truncateString(photo.alt, 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
