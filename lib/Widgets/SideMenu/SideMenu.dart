import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.onIndexCallBack});

  final void Function(int selectedIndex) onIndexCallBack;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer),
              child: Center(
                child: Image.asset('lib/assets/images/logo.webp'),
              )),
          // ListTile(
          //   leading: const Icon(Icons.dashboard),
          //   title: const Text("Dashboard"),
          //   selected: selectedIndex == 0,
          //   selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
          //   onTap: () => {_ontappedtile(0)},
          // ),
          const SizedBox(
            height: 5,
          ),
          ExpansionTile(
            title: const Text("Products"),
            leading: const Icon(Icons.shopping_bag),
            expandedAlignment: Alignment.bottomRight,
            childrenPadding: const EdgeInsets.only(left: 20),
            expansionAnimationStyle: AnimationStyle(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 300)),
            children: [
              ListTile(
                leading: const Icon(Icons.add),
                selected: selectedIndex == 0,
                selectedTileColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                title: const Text("Add Products"),
                onTap: () => {_ontappedtile(0)},
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                selected: selectedIndex == 1,
                selectedTileColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                title: const Text("Delete Products"),
                onTap: () => {_ontappedtile(1)},
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            selected: selectedIndex == 2,
            selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
            title: const Text("Delete Accounts"),
            onTap: () => {_ontappedtile(2)},
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text("Orders"),
            selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
            selected: selectedIndex == 3,
            onTap: () => {_ontappedtile(3)},
          )
        ],
      ),
    );
  }

  void _ontappedtile(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onIndexCallBack(selectedIndex);
  }
}
