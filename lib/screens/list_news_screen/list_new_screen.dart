// list_news_screen.dart
import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/generated/translations.g.dart';
import 'package:crypto_app/models/news_crypto/news_crypto.dart';
import 'package:crypto_app/screens/list_news_screen/cubit/list_news_screen_cubit.dart';
import 'package:crypto_app/shared_customization/extensions/build_context.ext.dart';
import 'package:crypto_app/shared_customization/widgets/app_container.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import '../../app_common_data/routes/app_routes.dart';
import 'components/news_card.dart';

class ListNewsScreen extends StatelessWidget {
  const ListNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListNewsScreenCubit()..fetchNews(category: 'crypto'),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE6F3FA), // Light blue
                Color(0xFFFCE4EC), // Light pink
              ],
            ),
          ),
          child: SafeArea(
            child: BlocConsumer<ListNewsScreenCubit, ListNewsScreenState>(
              listener: (context, state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${state.errorMessage}'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      action: SnackBarAction(
                        label: tr(LocaleKeys.ListNewsScreen_TryAgain),
                        textColor: Colors.white,
                        onPressed: () => context.read<ListNewsScreenCubit>().fetchNews(category: state.selectedCategory),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<ListNewsScreenCubit>();

                return RefreshIndicator(
                  onRefresh: () async => cubit.fetchNews(category: state.selectedCategory),
                  color: AppColors.primaryColor,
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      // App bar with title and favorite icon
                      SliverAppBar(
                        pinned: true,
                        floating: true,
                        elevation: 0,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        title: FadeInDown(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            tr(LocaleKeys.ListNewsScreen_CryptoNews),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        centerTitle: false,
                        actions: [
                          IconButton(
                            icon: Icon(Icons.bookmark, color: Colors.black87),
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.favoriteNewsScreen);
                            },
                            tooltip: 'Favorite News',
                          ),
                        ],
                      ),

                      // Categories
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        sliver: SliverToBoxAdapter(
                          child: SizedBox(
                            height: 36,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(width: 4),
                                FadeInUp(
                                  duration: const Duration(milliseconds: 500),
                                  child: _buildCategoryChip('All', state.selectedCategory ?? 'crypto', cubit),
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 100),
                                  duration: const Duration(milliseconds: 500),
                                  child: _buildCategoryChip('eth', state.selectedCategory ?? 'crypto', cubit),
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 200),
                                  duration: const Duration(milliseconds: 500),
                                  child: _buildCategoryChip('Ethereum', state.selectedCategory ?? 'crypto', cubit),
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 300),
                                  duration: const Duration(milliseconds: 500),
                                  child: _buildCategoryChip('DeFi', state.selectedCategory ?? 'crypto', cubit),
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 400),
                                  duration: const Duration(milliseconds: 500),
                                  child: _buildCategoryChip('NFT', state.selectedCategory ?? 'crypto', cubit),
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 500),
                                  duration: const Duration(milliseconds: 500),
                                  child: _buildCategoryChip('Regulation', state.selectedCategory ?? 'crypto', cubit),
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Content
                      if (state.isLoading == true)
                        SliverFillRemaining(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  tr(LocaleKeys.ListNewsScreen_Loading),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else if (state.newsList?.isEmpty ?? true)
                        SliverFillRemaining(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.article_outlined,
                                  size: 40,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  tr(LocaleKeys.ListNewsScreen_NoNewsAvailable),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextButton(
                                  onPressed: () => cubit.fetchNews(category: state.selectedCategory),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.primaryColor,
                                  ),
                                  child: Text(tr(LocaleKeys.ListNewsScreen_TryAgain)),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                final news = state.newsList![index];
                                return FadeInUp(
                                  delay: Duration(milliseconds: 100 * index),
                                  duration: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, Routes.newsDetailScreen, arguments: news);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.05),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: NewsCard(news: news),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              childCount: state.newsList!.length,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String currentCategory, ListNewsScreenCubit cubit) {
    final isActive = label.toLowerCase() == currentCategory.toLowerCase();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isActive
              ? LinearGradient(
            colors: [Colors.blue, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          border: isActive ? null : Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ChoiceChip(
          label: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : Colors.black87,
            ),
          ),
          selected: isActive,
          onSelected: (_) => cubit.fetchNews(category: label.toLowerCase()),
          selectedColor: Colors.transparent,
          backgroundColor: Colors.white.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}