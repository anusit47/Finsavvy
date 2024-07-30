import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';
import 'package:shop/home.dart';
import 'package:shop/route/screen_export.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = const [
    HomeScreen(),
    DiscoverScreen(),
    BookmarkScreen(),
    // EmptyCartScreen(), // if Cart is empty
    Home(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;
  final double _expProgress = 0.7; // Example experience progress value (70%)
  final int _currentExp = 70; // Example current experience value
  final int _maxExp = 100; // Example maximum experience value
  final int _level = 2; // Example level

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            BlendMode.srcIn),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/logo/Finsavvy.svg",
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 0), // Add some spacing between logo and image
            Container(
              width: 45, // Adjust the width as needed
              height: 45, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    12), // Adjust the border radius as needed
                image: const DecorationImage(
                  image: CachedNetworkImageProvider(
                    "https://scontent.fnak4-1.fna.fbcdn.net/v/t39.30808-1/247401069_2674942402801428_1510295725705619951_n.jpg?stp=dst-jpg_p200x200&_nc_cat=104&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=SmDHOPxJIPAQ7kNvgGgQTDC&_nc_ht=scontent.fnak4-1.fna&oh=00_AYD_nkjF-n2BgCnYi9HMpmPO5j2gHX8Zso1s7q2KrrjcIw&oe=66AE67EE", // Replace with your image URL
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, searchScreenRoute);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(
                width: 10), // Add some spacing between image and level
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anusit, Level $_level',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                    height: 3), // Adjust the height value to add space
                SizedBox(
                  width:
                      140, // Adjust the width of the experience bar as needed
                  height: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        5), // Adjust the border radius as needed
                    child: LinearProgressIndicator(
                      value: _expProgress,
                      backgroundColor: Colors.grey[300],
                      color: const Color.fromARGB(255, 78, 222, 0),
                    ),
                  ),
                ),
                const SizedBox(height: 3), // Add space between bar and text
                Text(
                  '$_currentExp / $_maxExp',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, notificationsScreenRoute);
            },
            icon: SvgPicture.asset(
              "assets/icons/Notification.svg",
              height: 24,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodyLarge!.color!,
                  BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/home.svg"),
              activeIcon: svgIcon("assets/icons/home.svg", color: primaryColor),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/book.svg"),
              activeIcon: svgIcon("assets/icons/book.svg", color: primaryColor),
              label: "Lesson",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/calendar.svg"),
              activeIcon:
                  svgIcon("assets/icons/calendar.svg", color: primaryColor),
              label: "Plan",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/chart.svg"),
              activeIcon:
                  svgIcon("assets/icons/chart.svg", color: primaryColor),
              label: "Graph",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/user.svg"),
              activeIcon: svgIcon("assets/icons/user.svg", color: primaryColor),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
