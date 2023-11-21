abstract final class ApiConst {
// static const _baseUrl = String.fromEnvironment(
//   "base_url",
//   defaultValue: "...",
// );
  static const _baseUrl = "https://api.unsplash.com";

  static const apiKey = "_b7G5MSmbx76SSPRWqaXPPKocMjW2Tq4MYPvvX7d1gk";

  static const allUnSplashPath = "$_baseUrl/photos";

// static const searchPostsPath = "$_baseUrl/photos/?client_id=_b7G5MSmbx76SSPRWqaXPPKocMjW2Tq4MYPvvX7d1gk";
// static const createNewPostPath = "$_baseUrl/posts/add";
//
// static String getPostFromId(int id) => "$_baseUrl/posts/$id";
//
// static String getUserPosts(int id) => "$_baseUrl/posts/user/$id";
//
// static String getPostComments(int id) => "$_baseUrl/posts/$id/comments";
//
// static String updatePost(int id) => "$_baseUrl/posts/$id";
//
// static String deletePost(int id) => "$_baseUrl/posts/$id";
//
  static Map<String, List<String>> searchQuery(String searchText) => {
    "q": [searchText],
  };

  static Map<String, List<String>> paginationQuery(int limit, int skip) => {
    "limit": ["$limit"],
    "skip": ["$skip"],
  };
}
