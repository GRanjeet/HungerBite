import 'package:flutter/material.dart';
import 'package:orderanytime/modules/data/dummy_data.dart';
import 'package:orderanytime/modules/screens/category_screen.dart';
import 'package:orderanytime/modules/screens/filters.dart';
import 'package:orderanytime/modules/screens/meal_screen.dart';
import 'package:orderanytime/modules/widget/main_drawer.dart';

import '../category/meal.dart';

const kInitialFielters = {
  Filter.glutenfree: false,
  Filter.lactosfree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedPageIndex = 0;
  final List<Meal> favoriteMeal = [];
  Map<Filter, bool> selectedFilters = kInitialFielters;

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void toggleMealFavoriteStatus(Meal meal) {
    final isExisting = favoriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeal.remove(meal);
      });
      showInfoMessage('Meal is no longer a favorite');
    } else {
      setState(() {
        favoriteMeal.add(meal);
        showInfoMessage('Marked as a favorite!');
      });
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void setScreen(String indentifier) async {
    Navigator.of(context).pop();
    if (indentifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => Filters(
            currentFilters: selectedFilters,
          ),
        ),
      );

      setState(() {
        selectedFilters = result ?? kInitialFielters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactosfree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoryScreen(
      onTaggleFavorite: toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealScreen(
        meals: favoriteMeal,
        onTaggleFavorite: toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
