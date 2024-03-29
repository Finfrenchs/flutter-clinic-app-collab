import 'package:flutter/material.dart';


import '../../../core/components/search_input.dart';
import '../../../core/core.dart';

class BuildAppBar extends StatelessWidget {
  final String title;
  final bool withSearchInput;
  final TextEditingController? searchController;
  final VoidCallback? searchTap;
  final String searchHint;

  const BuildAppBar({
    super.key,
    required this.title,
    this.withSearchInput = false,
    this.searchController,
    this.searchTap,
    this.searchHint = 'Cari di sini',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.stroke)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const Text(
                  'Sabtu, 24 Februari 2024',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),
          if (withSearchInput)
            Flexible(
              flex: 2,
              child: SearchInput(
                controller: searchController!,
                onTap: searchTap,
                hintText: searchHint,
              ),
            ),
          if (withSearchInput)
            const Flexible(flex: 1, child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
