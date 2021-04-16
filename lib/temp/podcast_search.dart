import 'package:podcast_search/podcast_search.dart';

class PodcastSearch {
  Search search = Search();

  Future<void> getResilts() async {
    search.search(
      "nhk",
    );
  }

  Future<Podcast> getPost() async {
    // RssFeed rssFeed = RssFeed();
    try {
      Podcast podcast = await Podcast.loadFeed(
          url: "http://pod.j-wave.co.jp/blog/tokiohot100/index.xml",
          timeout: 30000);
      print(podcast);
    } on Exception catch (e) {
      print(e);
    }
  }
}
