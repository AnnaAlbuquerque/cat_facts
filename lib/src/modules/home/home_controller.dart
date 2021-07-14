import 'package:cat_facts/src/core/Fact.dart';
import 'package:cat_facts/src/modules/home/home_repository.dart';

class HomeController {
  HomeRepository homeRepository = HomeRepository();
  Fact currentFact = Fact();

  Future<void> getFacts() async {
    final response = await homeRepository.getFacts();
    currentFact = response;
  }
}
