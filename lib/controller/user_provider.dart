import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xpay_task/controller/api_service.dart';
import '../model/user_model.dart';


class UserProvider with ChangeNotifier {
  List<User> allUsers = [];
 int currentPage = 0;
  void setUsers(List<User> users) {
    allUsers = users;
    notifyListeners();
  }

    int totalUsers = 0;
  final int pageLimit = 10; // Number of users per page

  int getCurrentPage() => currentPage;
  int getMaxPages() => (totalUsers / pageLimit).ceil();

void setCurrentPage(BuildContext context, int page) {
  currentPage = page;
  fetchResults(context); // Fetch data for the current page
  notifyListeners();
}

  void incrementPage() {
    if (currentPage < 10) {
      currentPage++;
      notifyListeners();
    }
  }

  void decrementPage() {
    if (currentPage > 1) {
      currentPage--;
      notifyListeners();
    }
  }

  void setTotalUsers(int total) {
    totalUsers = total;
    notifyListeners();
  }


     // Function to load data based on the current page
    Future<void> loadPage(BuildContext context,int page) async {
      setCurrentPage(context,page);
      await fetchResults(context); // Fetch data for the current page
    }

    // Function to load the next page
 Future<void> loadNextPage(BuildContext context) async {
  if (currentPage < 10) {
    incrementPage();
    await loadPage(context, currentPage); // Fetch data for the next page
  }
}

    // Function to load the previous page
    Future<void> loadPreviousPage(BuildContext context) async {
      if (currentPage >= 1) {
       decrementPage();
        await fetchResults(context); // Fetch data for the previous page
      }
    }

    
}