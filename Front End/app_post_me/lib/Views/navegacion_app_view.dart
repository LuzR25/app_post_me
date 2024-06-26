import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Providers/providers.dart';
import '../Widgets/widgets.dart';

class NavegacionAppView extends StatefulWidget {
  const NavegacionAppView({super.key});

  @override
  State<NavegacionAppView> createState() => _NavegacionAppViewState();
}

class _NavegacionAppViewState extends State<NavegacionAppView> {
  int _selectedIndex = 0;
  PageControllerProvider pageControllerProv = PageControllerProvider();
  final List<Widget> _pages = [
    const InicioWidget(),
    const CrearPublicacionWidget(),
    const PerfilWidget(),
    const ConfiguracionWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15.w,
        centerTitle: true,
        titleSpacing: 0,
        //backgroundColor: AppThemes.headerBackground,
        title: Text(
          'Post Me!',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        elevation: 0,
      ),
      body: PageView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return _pages[index];
        },
        scrollDirection: Axis.horizontal,
        controller: pageControllerProv.pageController,
        physics:
            const NeverScrollableScrollPhysics(), //! Tal vez si cambio esto, permita el scroll horizontal
      ),
      bottomNavigationBar: BottomNavigationBar(
          /* backgroundColor: Colors.black, //! Este color no se ve
        elevation: 0, */
          fixedColor: AppThemes.botonSeleccionado,
          backgroundColor: AppThemes.bottomNavigationBar,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          /* selectedItemColor: AppThemes.botonSeleccionado,
        unselectedItemColor: AppThemes.botonNoSeleccionado,
        showSelectedLabels: false,
        showUnselectedLabels: false, */
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              pageControllerProv.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.decelerate,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 10.w,
                ),
                label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_rounded,
                  size: 10.w,
                ),
                label: 'Crear publicación'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
                size: 10.w,
              ),
              label: 'Mi perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_rounded,
                size: 10.w,
              ),
              label: 'Configuración',
            )
          ]),
    );
  }
}

class PageItem extends StatefulWidget {
  final int index;

  const PageItem({
    super.key,
    required this.index,
  });

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.index == 0) {
      return const InicioWidget();
    } else if (widget.index == 1) {
      return const CrearPublicacionWidget();
    } else if (widget.index == 2) {
      return const PerfilWidget();
    } else {
      return const ConfiguracionWidget();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
