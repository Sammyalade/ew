import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final String? hintText;
  final Function(String) onSearch; // Callback to pass search text
  const SearchBarWidget({super.key, this.hintText, required this.onSearch});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: _searchController, // Assign the controller
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onTap: () {},
            onChanged: (value) {
              widget.onSearch(value); // Trigger the callback with the search term
            },
            leading: const Icon(Icons.search),
            hintText: widget.hintText ?? 'Search...',
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                // Use the same color for all states (hovered, focused, pressed)
                return Colors.grey[200]!; // Adjust the color if needed
              },
            ),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return [];
        },
      ),
    );
  }
}
