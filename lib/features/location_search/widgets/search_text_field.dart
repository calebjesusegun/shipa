import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipa/core/constants/app_colors.dart';
import 'package:shipa/features/location_search/model/location_data.dart';
import 'package:shipa/features/location_search/provider/location_search_provider.dart';

class SearchField extends ConsumerStatefulWidget {
  final String hint;
  final IconData icon;
  final Color iconColor;
  final ValueChanged<LocationData> onSelected;
  final String? selectedLabel;

  const SearchField({
    super.key,
    required this.hint,
    required this.icon,
    required this.iconColor,
    required this.onSelected,
    this.selectedLabel,
  });

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.selectedLabel != null) {
      _controller.text = widget.selectedLabel!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(locationSearchProvider);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? AppColors.primary300
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              Icon(widget.icon, color: widget.iconColor, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                  style: const TextStyle(fontSize: 14),
                  onChanged: (value) =>
                      ref.read(locationSearchProvider.notifier).search(value),
                  onTap: () {
                    ref.read(locationSearchProvider.notifier).clear();
                  },
                ),
              ),
              if (_controller.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _controller.clear();
                    ref.read(locationSearchProvider.notifier).clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(Icons.close, size: 16, color: Colors.grey[500]),
                  ),
                ),
            ],
          ),
        ),

        if (_focusNode.hasFocus) ...[
          const SizedBox(height: 4),
          switch (searchState) {
            SearchIdle() => const SizedBox.shrink(),
            SearchLoading() => const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary300,
                  ),
                ),
              ),
            ),
            SearchError(:final message) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                message,
                style: const TextStyle(color: AppColors.error, fontSize: 13),
              ),
            ),
            SearchSuccess(:final results) =>
              results.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'No results found',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 8),
                        ],
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: results.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (_, i) {
                          final place = results[i];
                          return ListTile(
                            dense: true,
                            leading: const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primary300,
                              size: 18,
                            ),
                            title: Text(
                              place.placeName,
                              style: const TextStyle(fontSize: 13),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              _controller.text = place.placeName;
                              _focusNode.unfocus();
                              ref.read(locationSearchProvider.notifier).clear();
                              widget.onSelected(place);
                            },
                          );
                        },
                      ),
                    ),
          },
        ],
      ],
    );
  }
}
