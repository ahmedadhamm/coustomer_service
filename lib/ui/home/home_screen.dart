import 'package:customers_service/ui/home/service_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/base.dart';
import '../../shared_data.dart';
import '../addRoom/add_room_screen.dart';
import '../login/login_screen.dart';
import 'home_veiw_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }

  @override
  void initState() {
    super.initState();
    viewModel.loadRooms();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: const Text(
                'Welcome MAK-OUR...',
              ),
              actions: [
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    SharedData.user = null;
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: const Icon(Icons.logout),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(child: Consumer<HomeViewModel>(
                  builder: (buildContext, homeViewModel, _) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12),
                      itemBuilder: (_, index) {
                        return ServiceWidget(homeViewModel.rooms[index]);
                      },
                      itemCount: homeViewModel.rooms.length,
                    );
                  },
                )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddRoomScreen.routeName);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }
}
