import 'package:dog_finder/screens/main/widgets/single_dog_type_card.dart';
import 'package:flutter/material.dart';
import '../../../common/models/dog_type.dart';
import '../main_entry.dart';

class HomeSliverGridView extends StatelessWidget {
  const HomeSliverGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.6,
        ),
        itemCount: dogTypes.length,
        itemBuilder: (BuildContext context, int index) {
          var item = dogTypes[index];

          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MainEntryScreen(
                  pageIndex: item.pageIndex,
                ),
              ),
            ),
            child: SingleDogTypeCard(dogType: item),
          );
        },
      ),
    );
  }
}
