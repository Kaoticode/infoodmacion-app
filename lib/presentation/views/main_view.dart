import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/presentation/screens/home_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController, 
        children: const [
          HomeScreen(),
          Center(child: Text("🛒 Shopping Cart")),
          Center(child: Text("❤️ Favorites")),
          Center(child: Text("💰 Monetization")),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.black,
        child: TabBar(
          dividerColor: Colors.transparent,
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelColor: AppStyle.primaryColor,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.home_outlined)),
            Tab(icon: Icon(Icons.shopping_cart)),
            Tab(icon: Icon(Icons.favorite_outline)),
            Tab(icon: Icon(Icons.monetization_on)),
          ],
        ),
      )
    );
  }
}
