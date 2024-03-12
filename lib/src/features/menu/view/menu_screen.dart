import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/src/features/menu/models/model_coffee_title.dart';
import 'package:flutter_coffee_shop/src/features/menu/view/widgets/category.dart';
import 'package:flutter_coffee_shop/src/theme/appcolors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuScreen extends StatefulWidget {
  final List<CategoryModel> categories;

  const MenuScreen({super.key, required this.categories});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Map<String, GlobalKey> categoryKeys;
  late String selectedCategoryName;
  late ItemPositionsListener itemListener;
  final ItemScrollController _menuController = ItemScrollController();
  final ItemScrollController _appBarController = ItemScrollController();
  int current = 0;
  bool inProgress = false;
  bool scrolledToBottom = false;

  @override
  void initState() {
    super.initState();
    itemListener = ItemPositionsListener.create();
    categoryKeys = {
      for (var category in widget.categories) category.categoryName: GlobalKey()
    };
    itemListener.itemPositions.addListener(() {
      final fullVisible = itemListener.itemPositions.value.firstWhere((item) {
        return item.itemLeadingEdge >= 0;
      }).index;

      if (((fullVisible != current) && inProgress != true) &&
          scrolledToBottom == false) {
        setCurrent(fullVisible);
        appBarScrollToCategory(fullVisible);
      }
    }
    );
  }

  void setCurrent(int newCurrent) {
    setState(() {
      current = newCurrent;
    });
  }

  void menuScrollToCategory(int ind) async {
    inProgress = true;
    _menuController.scrollTo(
        index: ind, duration: const Duration(milliseconds: 300));
    await Future.delayed(const Duration(milliseconds: 300));
    inProgress = false;
  }

  void appBarScrollToCategory(int ind) async {
    _appBarController.scrollTo(
        curve: Curves.easeOut,
        opacityAnimationWeights: [20, 20, 60],
        index: ind,
        duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: PreferredSize(
            preferredSize: const Size.fromHeight((40)),
            child: SizedBox(
              height: 40,
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.horizontal,
                itemScrollController: _appBarController,
                itemCount: widget.categories.length,
                itemBuilder: (context, index) {
                  final category = widget.categories[index];
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ElevatedButton(
                      onPressed: () {
                        setCurrent(index);
                        menuScrollToCategory(index);
                        appBarScrollToCategory(index);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: index == current
                              ? AppColors.bas
                              : AppColors.white),
                      child: Text(
                        category.categoryName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: index == current
                                ? AppColors.white
                                : AppColors.black),
                      )
                    )
                  );
                }
              )
            )
          )
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ScrollablePositionedList.builder(
            itemScrollController: _menuController,
            itemPositionsListener: itemListener,
            itemBuilder: (context, index) {
              final category = widget.categories[index];
              return Category(
                key: categoryKeys[category.categoryName],
                category: category,
              );
            },
            itemCount: widget.categories.length,
          ),
        ),
      ),
    );
  }
}