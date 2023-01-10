abstract class FavouritesStates {}

class InitialState extends FavouritesStates {}

class GetFavouritesLoadingState extends FavouritesStates {}

class GetFavouritesSuccessState extends FavouritesStates {}

class GetFavouritesErrorState extends FavouritesStates {}

class RemoveFavouriteFromDB extends FavouritesStates {}
