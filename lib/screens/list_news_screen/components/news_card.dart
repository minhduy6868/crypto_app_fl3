// news_card.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../app_common_data/routes/app_routes.dart';
import '../../../models/news_crypto/news_crypto.dart';
import '../../../services/service_repositories/authentication_reponsitiory_firebase.dart';
import '../../../services/service_repositories/authentication_repository.dart';

class NewsCard extends StatefulWidget {
  final NewsCrypto news;

  const NewsCard({super.key, required this.news});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  final AuthenticationRepositoryFirebase authRepo = AuthenticationRepositoryFirebase();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  Future<void> checkFavoriteStatus() async {
    if (widget.news.link != null) {
      final favoriteNews = await authRepo.getFavoriteNews();
      setState(() {
        isFavorite = favoriteNews.any((news) => news.link == widget.news.link);
      });
    }
  }

  Future<void> toggleFavorite() async {
    if (widget.news.link == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không thể lưu tin tức: Thiếu link')),
      );
      return;
    }
    try {
      if (isFavorite) {
        await authRepo.removeFavoriteNews(widget.news.link!);
      } else {
        await authRepo.addFavoriteNews(widget.news);
      }
      setState(() {
        isFavorite = !isFavorite;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isFavorite ? 'Đã thêm vào tin tức yêu thích' : 'Đã xóa khỏi tin tức yêu thích')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.1), width: 0.5),
      ),
      color: theme.colorScheme.surface,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.pushNamed(context, Routes.newsDetailScreen, arguments: widget.news);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.news.imageUrl != null && widget.news.imageUrl!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: widget.news.imageUrl!,
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.4,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: theme.colorScheme.surfaceContainer,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: theme.colorScheme.surfaceContainer,
                      child: Icon(Icons.error, color: theme.colorScheme.error),
                    ),
                  ),
                )
              else
                Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.image, color: theme.colorScheme.onSurfaceVariant),
                ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.news.sourceName != null && widget.news.sourceName!.isNotEmpty)
                          Expanded(
                            child: Text(
                              widget.news.sourceName!,
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.bookmark : Icons.bookmark_border,
                            color: isFavorite ? Colors.blue : theme.colorScheme.onSurfaceVariant,
                            size: 20,
                          ),
                          onPressed: toggleFavorite,
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Text(
                      widget.news.title ?? 'No Title',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                        height: 1.2,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    if (widget.news.description != null && widget.news.description!.isNotEmpty)
                      Text(
                        widget.news.description!,
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        if (widget.news.creator != null)
                          Expanded(
                            child: Text(
                              'By ${widget.news.creator is List ? (widget.news.creator as List).join(', ') : widget.news.creator}',
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onSurfaceVariant,
                                fontStyle: FontStyle.italic,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        if (widget.news.pubDate != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              DateFormat('d MMM yyyy').format(DateTime.parse(widget.news.pubDate!)),
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        if (widget.news.sentiment != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: _buildSentimentDot(widget.news.sentiment!),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSentimentDot(String sentiment) {
    Color color;
    switch (sentiment.toLowerCase()) {
      case 'positive':
        color = Colors.green;
        break;
      case 'negative':
        color = Colors.red;
        break;
      case 'neutral':
      default:
        color = Colors.amber;
        break;
    }

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}