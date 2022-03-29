import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_module_movie_app/utils/shared_widgets.dart';
import '../constants/app_constants.dart';
import '../models/movie_model.dart';
import '../redux/states/app_state.dart';
import '../redux/thunks/movie_thunk.dart';
import '../redux/viewmodels/movie_viewModel.dart';
import '../utils/text_styles.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(AppConstants.reduxModuleString.toUpperCase(),
            style: AppTextStyles.mediumGreyLargeTextStyle),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StoreConnector<AppState, MovieViewModel>(
                  onInit: (store) {
                    store.dispatch(getMovieDataThunk());
                  },
                  converter: (store) => MovieViewModel.fromStore(store),
                  builder: (BuildContext context, viewModel) {
                    if (viewModel.isFetching!) {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ));
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildCarousel(viewModel),
                          buildSizedBoxWidget(definedHeight: 10),
                          buildNewPlaying(viewModel),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildStarRating()
  {
    return SizedBox(
      height: 9,
      child: ListView.builder(
        itemCount: 5,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return  const Icon(
              Icons.star,
              color: Colors.red,
              size: 14,
            );
          }),
    );
  }

  Widget buildCarousel(viewModel)
  {
    return CarouselSlider.builder(
      itemCount: viewModel.userData!.length,
      itemBuilder:
          (BuildContext context, int index, int realIdx) {
        Result movie = viewModel.userData![index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MovieDetailScreen(movieId: movie.id),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              ClipRRect(
                child: CachedNetworkImage(
                  imageUrl:
                  '${AppConstants.originalImageBaseUrlString}${movie.backdropPath}',
                  height:
                  MediaQuery.of(context).size.height /
                      3,
                  width:
                  MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                AppConstants.notFoundImageAssetString),
                          ),
                        ),
                      ),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                  left: 15,
                ),
                child: Text(
                  movie.title!.toUpperCase(),
                  style: AppTextStyles.mediumWhiteLargeTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration:
        const Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
      ),
    );
  }

  Widget buildNewPlaying(viewModel)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              AppConstants.newPlayingString.toUpperCase(),
              style: AppTextStyles.mediumGreyLargeTextStyle
          ),
          buildSizedBoxWidget(definedHeight: 12),
          Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: viewModel.userData!.length,
                  separatorBuilder: (context, index) =>
                     const VerticalDivider(
                        color: Colors.transparent,
                        width: 5,
                      ),
                  itemBuilder: (context, index) {
                    Result result = viewModel.userData![index];
                    return buildNewPlayingListItem(result);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNewPlayingListItem(result)
  {
    return Stack(
      children: [
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailScreen(movieId: result.id),
                  ),
                );
              },
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl:
                  '${AppConstants.originalImageBaseUrlString}${result.backdropPath}',
                  imageBuilder: (context,
                      imageProvider) {
                    return Container(
                      width: 180,
                      height: 250,
                      decoration:
                      BoxDecoration(
                        borderRadius:
                        const BorderRadius
                            .all(
                          Radius.circular(
                              12),
                        ),
                        image:
                        DecorationImage(
                          image:
                          imageProvider,
                          fit: BoxFit
                              .cover,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context,
                      url, error) =>
                      Container(
                        width: 180,
                        height: 250,
                        decoration:
                        const BoxDecoration(
                          image:
                          DecorationImage(
                            image: AssetImage(
                                AppConstants.notFoundImageAssetString),
                          ),
                        ),
                      ),
                ),
              ),
            ),
            buildSizedBoxWidget(definedHeight: 10),
            SizedBox(
              width: 180,
              child: Text(
                result.title!
                    .toUpperCase(),
                style: AppTextStyles.regularForSmallGreyTextStyle,
                overflow:
                TextOverflow.ellipsis,
              ),
            ),
            buildStarRating()
          ],
        )
      ],
    );
  }
}
