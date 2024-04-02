import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../core/components/search_input.dart';
import '../../../core/core.dart';

class BuildAppBar extends StatefulWidget {
  final String title;
  final bool withSearchInput;
  final TextEditingController? searchController;
  final Function(String value)? onChanged;
  final VoidCallback? searchTap;
  final String searchHint;

  const BuildAppBar({
    super.key,
    required this.title,
    this.withSearchInput = false,
    this.searchController,
    this.searchTap,
    this.onChanged,
    this.searchHint = 'Cari di sini',
  });

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> {
  late final String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now());
  }

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
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ),
          if (widget.withSearchInput)
            Flexible(
              flex: 2,
              child: SearchInput(
                controller: widget.searchController!,
                onTap: widget.searchTap,
                hintText: widget.searchHint,
                onChanged: widget.onChanged,
              ),
            ),
          if (widget.withSearchInput)
            const Flexible(flex: 1, child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
