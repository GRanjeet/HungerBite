import 'package:flutter/material.dart';
import 'package:orderanytime/modules/category/category.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid(
      {Key? key, required this.category, required this.onselectCategory})
      : super(key: key);

  final Category category;
  final void Function() onselectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onselectCategory(),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
