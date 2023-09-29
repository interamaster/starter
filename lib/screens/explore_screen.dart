import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();
  ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 2
    // TODO: Add TodayRecipeListView FutureBuilder
    // return const Center(
    //   child: Text('Explore Screen'),
    // );
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
// 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
// 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes ?? [];
          // TODO: Replace this with TodayRecipeListView
          /* return Center(
            child: Container(
              child: const Text('Show TodayRecipeListView'),
            ),
          );*/
          return TodayRecipeListView(recipes: recipes);
        } else {
// 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
