import 'package:almabad/core/text_translation/text_translation.dart';
import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/temple_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Temple> temples;

  CustomSearchDelegate(this.temples);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Temple> results = temples
        .where(
            (temple) => temple.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return TempleWidget(temple: results[0]);
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    // Show a loading indicator while processing
    return FutureBuilder<List<Temple>>(
      future: _getSuggestions(
          query), // Call a function that performs the async operation
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No suggestions found.'));
        } else {
          final suggestions = snapshot.data!;
          return PageView.builder(
            controller: PageController(viewportFraction: .8),
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: TempleWidget(
                      temple: suggestions[index],
                    ),
                  ),
                  TranslateText(
                    text: suggestions[index].name,
                    error: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    textStyle: TextStyle(fontSize: 18.sp),
                  )
                ],
              );
            },
          );
        }
      },
    );
  }

// Function to filter suggestions asynchronously
  Future<List<Temple>> _getSuggestions(String query) async {
    final List<Temple> filteredTemples = [];
    for (var temple in temples) {
      final translatedName =
          await TextTranslation().translation(input: temple.name);
      if (translatedName.toLowerCase().contains(query.toLowerCase())) {
        filteredTemples.add(temple);
      }
    }
    return filteredTemples;
  }
}


