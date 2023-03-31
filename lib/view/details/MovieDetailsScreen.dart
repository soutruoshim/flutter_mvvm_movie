
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_movie/res/AppContextExtension.dart';

import '../../models/movieslist/movie.dart';
import '../../utils/Utils.dart';
import '../widget/MyChips.dart';
import '../widget/MyTextView.dart';


class MovieDetailsScreen extends StatelessWidget {

  static final String id = "movie_details";

  final Movie? movieData;

  // receive data from the HomeScreen as a parameter
  MovieDetailsScreen(this.movieData);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(context.resources.strings.movieDetailScreen)),
      body: Container(
        color: context.resources.color.colorWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.resources.dimension.smallMargin),
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    "https://image.tmdb.org/t/p/original${movieData?.posterPath}",
                    errorBuilder: (context, error, stackTrace) {
                      return new Image.asset('assets/images/img_error.png');
                    },
                    fit: BoxFit.fill,
                    height: context.resources.dimension.imageHeight,
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                          title: MyTextView(movieData?.title ?? "NA",context.resources.color.colorPrimaryText,context.resources.dimension.bigText,),
                          subtitle: MyTextView(movieData?.releaseDate??"NA",context.resources.color.colorSecondaryText,context.resources.dimension.mediumText,),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyTextView("${Utils.setAverageRating([])}",context.resources.color.colorBlack,context.resources.dimension.mediumText),
                              SizedBox(width: context.resources.dimension.verySmallMargin,),
                              Icon(Icons.star,color: context.resources.color.colorAccent,),
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.resources.dimension.defaultMargin),
                        child: Container(child: MyTextView(context.resources.strings.titleCategories,context.resources.color.colorPrimaryText, context.resources.dimension.bigText,),alignment: AlignmentDirectional.topStart,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
                        child: _setChipView(movieData?.genreIds,context.resources.color.catChipColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.resources.dimension.defaultMargin),
                        child: Container(child: MyTextView(context.resources.strings.titleCast,context.resources.color.colorPrimaryText, context.resources.dimension.bigText),alignment: AlignmentDirectional.topStart,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
                        child: _setChipView(movieData?.genreIds,context.resources.color.castChipColor),
                      ),
                    ],
                  ),
                  elevation: context.resources.dimension.highElevation,
                  margin: EdgeInsets.all(context.resources.dimension.smallMargin),
                  color: context.resources.color.colorWhite,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _setChipView(List<int>? data,Color color) {
    var size = data?.length??0;
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8,
        children: [
          for (var i = 0; i < size; i++)
            MyChips(data?[i].toString()??"NA", color)
        ],
      ),
    );
  }
}
