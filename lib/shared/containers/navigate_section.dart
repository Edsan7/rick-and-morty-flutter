import 'package:flutter/material.dart';
import 'package:rick_and_morty/shared/containers/page_navigate_button.dart';
import 'package:rick_and_morty/shared/containers/description_text.dart';


class NavigateSection extends StatelessWidget {
  final int totalPages;
  final int actualPage;
  final Function previousPage;
  final Function nextPage;

  const NavigateSection({
    Key key,
    @required this.totalPages,
    @required this.actualPage,
    @required this.previousPage,
    @required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.04),
      constraints: const BoxConstraints(minHeight: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          actualPage != 1
              ? PageNavigateButton(
                  icon: Icon(Icons.navigate_before),
                  goToPage: previousPage,
                )
              : Container(),
          DescriptionText(label: 'Page: ${actualPage.toString()}', fontSize: 17),
          actualPage != totalPages
              ? PageNavigateButton(
                  icon: Icon(Icons.navigate_next),
                  goToPage: nextPage,
                )
              : Container(),
        ],
      ),
    );
  }
}
