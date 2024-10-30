import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:key_fields_com/bloc/main_bloc/main_bloc.dart';
import 'package:key_fields_com/bloc/main_bloc/main_event.dart';
import 'package:key_fields_com/bloc/menu_bloc/menu_bloc.dart';
import 'package:key_fields_com/bloc/menu_bloc/menu_event.dart';
import 'package:key_fields_com/bloc/menu_bloc/menu_state.dart';
import 'package:key_fields_com/ui/solutions/solution_page.dart';
import 'package:key_fields_com/ui/tms/tms_home_page.dart';
import 'package:key_fields_com/ui/wms/wms_home_page.dart';
import 'package:key_fields_com/utils/app_bar_utils.dart';
import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:key_fields_com/utils/device_checker.dart';

import 'about/about_page.dart';
import 'account/account_home_page.dart';
import 'container/container_home_page.dart';
import 'container_yard/container_yard_home_page.dart';
import 'freight/freight_home_page.dart';
import 'home/home_page.dart';
import 'investor_relation/invertor_relation_home_page.dart';
import 'nfc/nfc_page.dart';

class MenuPage extends StatelessWidget{

  final menuTree = TreeNode.root()
    ..addAll(
      [
        TreeNode(key: "Home", data: Icons.home_outlined),
        TreeNode(key: "About Us", data: Icons.dashboard),
        TreeNode(key: "Solutions", data: Icons.description)
          ..addAll([
            TreeNode(key: "Solutions"),
            TreeNode(key: "Warehouse Management System"),
            TreeNode(key: "Transport Management System"),
            TreeNode(key: "Freight Management System"),
            TreeNode(key: "Container Management System"),
            TreeNode(key: "Container-Yard Management System"),
            TreeNode(key: "Accounting"),
          ]),
        TreeNode(key: "Investor Relations", data: Icons.cable)
          ..addAll([
            TreeNode(key: "Investor Relations"),
            TreeNode(key: "Our Journey"),
            TreeNode(key: "Investor Management"),
          ]),
        TreeNode(key: "News", data: Icons.collections_bookmark)
          ..addAll([
            TreeNode(key: "News"),
            TreeNode(key: "Gallery"),
          ]),
        TreeNode(key: "Contact Us", data: Icons.contact_mail),
        TreeNode(key: "Our Portals", data: Icons.keyboard_double_arrow_right),
        TreeNode(key: "NFC", data: Icons.nfc),
      ],
    );

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
       child: Scaffold(
           appBar: isMenuWebView()?null:AppBar(
               iconTheme: const IconThemeData(color: Colors.white),
               backgroundColor: getAppBarBgColor(context),
               title : BlocBuilder<MenuBloc, MenuState>(
                   builder: (context, state) {
                     if (state is MenuSuccess) {
                       return Text(state.menu, style: getAppBarTextStyle(context),);
                     }

                     return Text("KEYFields.com", style: getAppBarTextStyle(context));
                   }
               )
           ),
           drawer: isMenuWebView()?null:BlocBuilder<MenuBloc, MenuState>(
             builder: (context, state) {
               if (state is MenuSuccess) {
                 return menuView(context,state);
               }else if (state is MenuError) {
                 return Text(state.errMessage);
               }else{
                 const CircularProgressIndicator();
               }

               return const SizedBox.shrink();
             },
           ),
           body: BlocBuilder<MenuBloc, MenuState>(
             builder: (context, state) {
               if (state is MenuSuccess) {
                 return Row(
                   children: [

                     isMenuWebView()?menuView(context, state):const SizedBox.shrink(),

                     Expanded(
                       child: ScreensView(menu: state.menu),
                     ),
                   ],
                 );
               }else if (state is MenuError) {
                 return Text(state.errMessage);
               }else{
                 const CircularProgressIndicator();
               }

               return const SizedBox.shrink();
             },
           )
       ),
       create: (_) => MenuBloc()..add(FetchMenuEvent(menu:"Home")));
  }



  /// WebMenu View
  Widget menuView(BuildContext context, MenuState state) {
    return Container(
      color: const Color(0xFF171719),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: SizedBox(
          width: isMenuWebView()?320:250,
          child: Column(
            children: [

              getMenuHeaderView(context),
              // Sidebar menu widget
              Container(
                color: const Color(0xFF171719),
                child: TreeView.simple(
                  shrinkWrap: true,
                  showRootNode: false,
                  tree: menuTree,
                  indentation: const Indentation(width: 0),
                  expansionBehavior: ExpansionBehavior.collapseOthers,
                  expansionIndicatorBuilder: (context, node) {
                    return ChevronIndicator.rightDown(
                      alignment: Alignment.centerRight,
                      tree: node,
                      color: Colors.white,
                      icon: Icons.arrow_right,
                    );
                  },
                  onItemTap: (item) {

                    if(item.childrenAsList.isEmpty){
                      BlocProvider.of<MainBloc>(context).add(AddTitleEvent(title: item.key));
                    }

                    if(!isMenuWebView() && item.childrenAsList.isEmpty){
                      Navigator.pop(context);
                    }

                    BlocProvider.of<MenuBloc>(context).add(FetchMenuEvent(menu: item.key));
                  },
                  builder: (context, node) {
                    final isSelected = state.menu == node.key;
                    final isExpanded = node.isExpanded;
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      opaque: true,
                      child: Container(
                        color: node.level >= 2 || isExpanded ? const Color(0xFF313136) : const Color(0xFF171719),
                        height: 42, // Padding between one menu and another.
                        width: isWebView()?320:250,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: node.level >= 2 ? const EdgeInsets.only(left: 27) : const EdgeInsets.only(left: 0),
                          child: Container(
                            width: isWebView()?320:250,
                            height: 45, // The size dimension of the active button
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              //color: isSelected ? node.isLeaf ? const Color(0xFF2c45e8) : null : null,
                              color: isSelected ? node.isLeaf ? Colors.blueGrey.withOpacity(0.5)  : null : null,
                              borderRadius:
                              const BorderRadius.only(
                                topLeft: Radius.circular(50,),
                                bottomLeft: Radius.circular(50,),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 25,
                              ),
                              child: node.level >= 2 ? Text(node.key, style: const TextStyle(color: Colors.white, fontSize: 14,),
                              ): Row(
                                children: [
                                  Icon(node.data, size: 20, color: Colors.white,),
                                  const SizedBox(width: 6,),
                                  Text(
                                    node.key,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  /// Menu Header View
  Widget getMenuHeaderView(BuildContext context) {
    return  Container(
      color: Colors.white,
      height: 200,
      width: isMenuWebView()?320:250,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top:20,bottom:20),
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Image.asset("assets/images/kf-logo.png", fit: BoxFit.fill,),
      ),
    );
  }

}



/// Screen View
class ScreensView extends StatelessWidget {
  final String menu;
  const ScreensView({Key? key, required this.menu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (menu) {
      case 'Home':
        page = HomePage();
        break;
      case 'About Us':
        page = AboutPage();
        break;
      case 'Solutions':
        page = const SolutionPage();
        break;
      case 'Warehouse Management System':
        page =  WMSHomePage();
        break;
      case 'Transport Management System':
        page = TmsHomePage();
        break;
      case 'Freight Management System':
        page = FreightHomePage();
        break;
      case 'Container Management System':
        page = ContainerHomePage();
        break;
      case 'Container-Yard Management System':
        page = ContainerYardHomePage();
        break;
      case 'Accounting':
        page = AccountHomePage();
        break;
      case 'Investor Relations':
        page = InvertorRelationHomePage();
        break;
      case 'NFC':
        page = NFCPage();
        break;
      default:
        page = const Center(
          child: Text(
            "Coming Soon",
            style: TextStyle(
              color: Color(0xFF171719),
              fontSize: 22,
            ),
          ),
        );
    }
    return page;
  }
}
