import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/app_common_data/app_colors.dart';
import 'package:crypto_app/generated/translations.g.dart';
import 'package:crypto_app/models/news_crypto/news_crypto.dart';
import 'package:crypto_app/screens/news_detail_screen/cubit/news_detail_screen_cubit.dart';
import 'package:crypto_app/shared_customization/widgets/app_container.dart';
import 'package:crypto_app/shared_customization/widgets/texts/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsCrypto news;

  const NewsDetailScreen({super.key, required this.news});

  // Function to open the original article URL
  Future<void> _launchUrl(BuildContext context) async {
    if (news.link == null || news.link!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr(LocaleKeys.ListNewsScreen_NoLinkAvailable)),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
      return;
    }

    final Uri url = Uri.parse(news.link!);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(tr(LocaleKeys.ListNewsScreen_FailedToOpenLink)),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Parse pubDate to DateTime, fallback to current date if invalid
    DateTime publishedDate;
    try {
      publishedDate = DateTime.parse(news.pubDate ?? '');
    } catch (e) {
      publishedDate = DateTime.now();
    }

    // Unique hero tag for image transition
    final heroTag = 'news_image_${news.link ?? news.title ?? UniqueKey().toString()}';

    // Gradient for buttons
    final buttonGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF267C7C), // Light green
        Color(0xFF065A61), // Emerald green
      ],
    );

    return BlocProvider(
      create: (_) => NewsDetailScreenCubit(),
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
            child: BlocConsumer<NewsDetailScreenCubit, NewsDetailScreenState>(
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
                        onPressed: () => context.read<NewsDetailScreenCubit>().evaluateNews(news),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<NewsDetailScreenCubit>();

                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    // App bar
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      elevation: 0,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      leading: FadeInLeft(
                        duration: const Duration(milliseconds: 500),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      title: FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: AppText(
                          tr(LocaleKeys.ListNewsScreen_NewsDetail),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      actions: [
                        FadeInRight(
                          duration: const Duration(milliseconds: 500),
                          child: IconButton(
                            icon: const Icon(Icons.share, color: Colors.black87),
                            onPressed: () {
                              Share.share(
                                '${news.title ?? 'News Article'}\n${news.link ?? ''}',
                                subject: news.title ?? 'News Article',
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    // News content
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          child: AppContainer(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // News image with Hero animation
                                if (news.imageUrl != null && news.imageUrl!.isNotEmpty)
                                  Hero(
                                    tag: heroTag,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                      child: CachedNetworkImage(
                                        imageUrl: news.imageUrl!,
                                        width: double.infinity,
                                        height: 220,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Container(
                                          height: 220,
                                          color: Colors.grey[200],
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          height: 220,
                                          color: Colors.grey[200],
                                          child: const Icon(
                                            Icons.broken_image,
                                            size: 40,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                // Content padding
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Title
                                      AppText(
                                        news.title ?? 'No title',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                          height: 1.3,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      // Source and date in a card
                                      AppContainer(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.grey[50],
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: AppText(
                                                news.sourceName ?? 'Unknown source',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[700],
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            AppText(
                                              DateFormat('dd MMM yyyy').format(publishedDate),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 20),

                                      // Description
                                      if (news.description != null && news.description!.isNotEmpty)
                                        AppText(
                                          news.description!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                            height: 1.6,
                                          ),
                                        ),

                                      const SizedBox(height: 20),

                                      // Action Buttons
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // AI Evaluation Button
                                          state.isLoading
                                              ? const CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                                          )
                                              : Container(
                                            decoration: BoxDecoration(
                                              gradient: buttonGradient,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () => cubit.evaluateNews(news),
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.transparent,
                                                elevation: 0,
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Flexible(
                                                child: AppText(
                                                  tr(LocaleKeys.ListNewsScreen_AIEvaluation),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          // Read Original Button
                                          Container(
                                            decoration: BoxDecoration(
                                              gradient: buttonGradient,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () => _launchUrl(context),
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.white,
                                                backgroundColor: Colors.transparent,
                                                elevation: 0,
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Flexible(
                                                child: AppText(
                                                  tr(LocaleKeys.ListNewsScreen_ReadOriginal),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // AI Evaluation Result
                                      if (state.aiEvaluation != null)
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: AppContainer(
                                            borderRadius: BorderRadius.circular(12),
                                            padding: const EdgeInsets.all(16),
                                            color: Colors.grey[50],
                                            child: AppText(
                                              state.aiEvaluation!,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                                height: 1.6,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}