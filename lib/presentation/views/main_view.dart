import 'package:flutter/material.dart';
import 'package:infoodmacion_app/config/styles/app_style.dart';
import 'package:infoodmacion_app/config/util/utils.dart';
import '../screens/screens.dart';

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
    _tabController.addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _tabController.index == 0 ? null : AppBar(
        backgroundColor: AppStyle.primaryColor,
        title: Text(_tabController.index == 1 ? 'Carrito' : _tabController.index == 2 ? 'Notificaciones': 'Soporte'),
        actions: [
          _tabController.index == 1 ? IconButton(
            icon: const Icon(Icons.calculate),
            onPressed: () => Utils.showModalNutritionStats(context),
          ) : const SizedBox.shrink()
        ],
      ),
      body: TabBarView(
        controller: _tabController, 
        children: const [
          HomeScreen(),
          CartScreen(),
          NotificationScreen(),
          SupportScreen()
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