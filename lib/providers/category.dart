import 'package:flutter/material.dart';
import '../services/category.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier{
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];
  List<String> categoriesNames = [];
  String selectedCategory;

  CategoryProvider.initialize(){
    loadCategories();
  }

  loadCategories()async{
    categories = await _categoryServices.getCategories();
    for(CategoryModel category in categories){
      categoriesNames.add(category.category);
    }
    selectedCategory = categoriesNames[0];
    notifyListeners();
  }

  changeSelectedCategory({String newCategory}){
    selectedCategory = newCategory;
    notifyListeners();
  }
}