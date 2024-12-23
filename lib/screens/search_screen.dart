import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:job_app/services/home_service.dart';
import 'package:job_app/model/photos.dart';
import 'package:job_app/widgets/home/job_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final HomeService _homeService = HomeService();
  List<Photo> _searchResults = [];
  List<String> _recentSearches = [];
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadRecentSearches(); // Load recent searches from local storage
  }

  /// Fetch search results based on the query
  void _searchPhotos(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final results = await _homeService.searchPhoto(query);
      setState(() {
        _searchResults = results;
      });

      if (query.length >= 3 && !_recentSearches.contains(query)) {
        _addRecentSearch(query); // Save to recent searches
      }
    } catch (e) {
      print('Error fetching search results: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Add a new search term to recent searches
  void _addRecentSearch(String search) async {
    setState(() {
      _recentSearches.add(search);
    });
    await _saveRecentSearches();
  }

  /// Save recent searches to local storage
  Future<void> _saveRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('recentSearches', _recentSearches);
  }

  /// Load recent searches from local storage
  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches = prefs.getStringList('recentSearches') ?? [];
    });
  }

  /// Clear recent searches
  void _clearRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches.clear();
    });
    await prefs.remove('recentSearches');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController, // Attach the controller
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    prefixIcon: const Icon(Icons.search, color: Colors.white54),
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: _searchPhotos, // Trigger API call on text change
                ),
              ),

              // Recent Searches Section
              if (_recentSearches.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Searches',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      TextButton(
                        onPressed: _clearRecentSearches, // Clear all searches
                        child: const Text('Clear All',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              if (_recentSearches.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: _recentSearches
                          .map((search) => GestureDetector(
                                onTap: () {
                                  _searchController.text =
                                      search; // Update the search field
                                  _searchPhotos(
                                      search); // Perform search on tap
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8.0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Text(
                                    search,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),

              // Search Results
              if (_isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
              else if (_searchResults.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No results found.',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final photo = _searchResults[index];
                      return JobCard(
                        imageUrl: photo.src.original,
                        photoDetail: photo,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
