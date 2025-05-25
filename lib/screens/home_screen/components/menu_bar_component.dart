import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MenuBarComponent extends StatelessWidget {
  const MenuBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    const double bannerHeight = 110.0;
    const double menuItemSize = 48.0;
    const double iconSize = 22.3;
    const double spacing = 10.0;

    final List<Map<String, dynamic>> bannerItems = [
      {
        'backgroundImage': 'https://s3.tradingview.com/p/PJxCVapB_mid.png',
        'sideImage': 'assets/images/robotcoin.png',
        'text': 'Try our AI for avoid huge loss',
      },
      {
        'backgroundImage': 'https://cdn.prod.website-files.com/634054c00f602044abb3060d/649dbabdc84462834f23bfd1_Best%20Ethereum%20Wallet.webp',
        'sideImage': 'assets/images/robotcoin.png',
        'text': 'Discover new features today',
      },
      {
        'backgroundImage': 'https://bitcoinvn.io/news/wp-content/uploads/2024/11/cach-doc-bieu-do-tien-dien-tu-19.jpg',
        'sideImage': 'assets/images/robotcoin.png',
        'text': 'Boost your earnings now',
      },
    ];

    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.question_answer_outlined,
        'title': 'FAQ',
        'route': '/faq',
      },
      {
        'icon': Icons.receipt_long,
        'title': 'About',
        'route': '/about',
      },
      {
        'icon': Icons.swap_horiz,
        'title': 'Convert',
        'route': '/convert',
      },
      {
        'icon': Icons.info,
        'title': 'Report',
        'route': '/report',
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(spacing),
            child: SizedBox(
              height: bannerHeight,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: bannerHeight,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2.0,
                      enableInfiniteScroll: true,
                    ),
                    items: bannerItems.map((item) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              item['backgroundImage'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: bannerHeight,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.blue,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 10, // Moved to bottom corner
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                item['text'],
                                style: const TextStyle(
                                  color: Colors.white, // Changed to white
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Positioned(
                    right: -30,
                    top: 10,
                    child: Image.asset(
                      bannerItems[0]['sideImage'],
                      height: bannerHeight + 40,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            padding: const EdgeInsets.symmetric(horizontal: spacing, vertical: spacing),
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: 0.8,
            children: menuItems.map((item) {
              return _MenuItem(
                icon: item['icon'],
                title: item['title'],
                onTap: () => Navigator.pushNamed(context, item['route']),
                itemSize: menuItemSize,
                iconSize: iconSize,
                primaryColor: Colors.blue,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final double itemSize;
  final double iconSize;
  final Color primaryColor;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.itemSize,
    required this.iconSize,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: itemSize,
            height: itemSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: primaryColor.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.1),
                  blurRadius: 4.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: primaryColor,
              size: iconSize,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}