/// here we use generic as a atype as this my differ from
/// like fav films or fav tv shows or fav actors.

abstract class FavoritesDatabase<T, E> {
  Future<List<T>> allFav();
  Future<T?> find(E id);
  Future<T> insertFav(final T item);
  Future<void> updateFav(final T item);
  Future<void> deleteFav(final int id);
}
