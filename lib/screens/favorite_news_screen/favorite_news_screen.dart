// favorite_news_screen.dart
import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/generated/translations.g.dart';
import 'package:crypto_app/models/news_crypto/news_crypto.dart';
import 'package:crypto_app/screens/list_news_screen/components/news_card.dart';
import 'package:crypto_app/services/service_repositories/authentication_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../app_common_data/routes/app_routes.dart';
import '../../services/service_repositories/authentication_reponsitiory_firebase.dart';

class FavoriteNewsScreen extends StatefulWidget {
  const FavoriteNewsScreen({super.key});

  @override
  _FavoriteNewsScreenState createState() => _FavoriteNewsScreenState();
}

class _FavoriteNewsScreenState extends State<FavoriteNewsScreen> {
  final AuthenticationRepositoryFirebase authRepo = AuthenticationRepositoryFirebase();
  List<NewsCrypto> favoriteNewsList = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchFavoriteNews();
  }

  Future<void> fetchFavoriteNews() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      if (authRepo.currentUser == null) {
        setState(() {
          errorMessage = tr(LocaleKeys.Login);
          isLoading = false;
        });
        Navigator.pushNamed(context, Routes.loginScreen);
        return;
      }
      final favoriteNews = await authRepo.getFavoriteNews();
      setState(() {
        favoriteNewsList = favoriteNews;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Debug translation
    final titleTranslation = tr(LocaleKeys.ListNewsScreen_All);
    final errorTranslation = tr(LocaleKeys.Login_AccountNotActive);
    final emptyTranslation = tr(LocaleKeys.CommonData_CantLoadData);
    final tryAgainTranslation = tr(LocaleKeys.ListNewsScreen_TryAgain);
    print('DEBUG: Title translation: $titleTranslation');
    print('DEBUG: Error translation: $errorTranslation');
    print('DEBUG: Empty translation: $emptyTranslation');
    print('DEBUG: Try Again translation: $tryAgainTranslation');
    print('DEBUG: Current locale: ${context.locale}');

    return Scaffold(
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
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.white.withOpacity(0.1),
                title: FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    titleTranslation,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                centerTitle: false,
              ),
              if (isLoading)
                const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                    ),
                  ),
                )
              else if (errorMessage != null)
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          errorMessage!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: fetchFavoriteNews,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primaryColor,
                          ),
                          child: Text(tryAgainTranslation),
                        ),
                      ],
                    ),
                  ),
                )
              else if (favoriteNewsList.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_border,
                            size: 40,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            emptyTranslation,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
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
                          final news = favoriteNewsList[index];
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
                        childCount: favoriteNewsList.length,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}