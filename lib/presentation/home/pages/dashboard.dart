import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_app/core/core.dart';
import 'package:flutter_clinic_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_clinic_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_clinic_app/presentation/master/pages/data_schedule_doctor_page.dart';
import 'package:flutter_clinic_app/presentation/master/pages/data_service_page.dart';
import 'package:flutter_clinic_app/presentation/master/pages/master_page.dart';
import 'package:flutter_clinic_app/presentation/master/pages/schedule_pasient_page.dart';

import '../../master/pages/data_doctor_page.dart';
import '../../master/pages/data_patient_page.dart';
import '../widgets/nav_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _dataMasterIndex = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    _dataMasterPages = [
      MasterPage(
        onTap: (index) {
          _dataMasterIndex = index;
          setState(() {});
        },
      ),
      const DataDoctorPage(),
      const DataPatientPage(),
      const DataScheduleDoctorPage(),
      const DataServicePage(),
    ];

    _pages = [
      const Center(child: Text('This is page 1')),
      MasterPage(onTap: (_) {}),
      const Center(child: Text('This is page 3')),
      const SchedulePasientPage(),
      const Center(child: Text('This is page 5')),
      const Center(child: Text('This is page 6')),
    ];
    super.initState();
  }

  late final List<Widget> _dataMasterPages;
  late final List<Widget> _pages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(16.0)),
                child: SizedBox(
                  height: context.deviceHeight - 20.0,
                  child: ColoredBox(
                    color: AppColors.primary,
                    child: Column(
                      children: [
                        NavItem(
                          iconPath: Assets.icons.logo.path,
                          isActive: _selectedIndex == 0,
                          onTap: () => _onItemTapped(0),
                        ),
                        NavItem(
                          iconPath: Assets.icons.folderOpen.path,
                          isActive: _selectedIndex == 1,
                          onTap: () => _onItemTapped(1),
                        ),
                        NavItem(
                          iconPath: Assets.icons.chartPie.path,
                          isActive: _selectedIndex == 2,
                          onTap: () => _onItemTapped(2),
                        ),
                        NavItem(
                          iconPath: Assets.icons.shoppingBagProduct.path,
                          isActive: _selectedIndex == 3,
                          onTap: () => _onItemTapped(3),
                        ),
                        NavItem(
                          iconPath: Assets.icons.setting.path,
                          isActive: _selectedIndex == 4,
                          onTap: () => _onItemTapped(4),
                        ),
                        NavItem(
                          iconPath: Assets.icons.history.path,
                          isActive: _selectedIndex == 5,
                          onTap: () => _onItemTapped(5),
                        ),
                        BlocListener<LogoutBloc, LogoutState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              success: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              error: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                    backgroundColor: AppColors.red,
                                  ),
                                );
                              },
                              orElse: () {},
                            );
                          },
                          child: NavItem(
                            iconPath: Assets.icons.logOut.path,
                            isActive: false,
                            onTap: () {
                              context
                                  .read<LogoutBloc>()
                                  .add(const LogoutEvent.logout());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (_selectedIndex == 1)
              Expanded(
                child: _dataMasterPages[_dataMasterIndex],
              )
            else
              Expanded(
                child: _pages[_selectedIndex],
              ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    _dataMasterIndex = 0;
    setState(() {});
  }
}
