import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:okoul/components/error_widget.dart';
import 'package:okoul/constants/api.dart';
import 'package:okoul/src/view/film/models/movie_model/production_company.dart';

class ProductionCompanies extends StatelessWidget {
  const ProductionCompanies({
    Key? key,
    this.productionCompanies,
  }) : super(key: key);
  final List<ProductionCompany>? productionCompanies;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: productionCompanies != null || productionCompanies!.isEmpty
            ? SizedBox(
                height: 160,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Production Companies',
                      // maxLines: 2,

                      style: TextStyle(fontSize: 22, height: 1),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productionCompanies!.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16,
                        ),
                        itemBuilder: (context, index) => SizedBox(
                          height: 20,
                          width: 100,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: productionCompanies![index].logoPath !=
                                        null
                                    ? CachedNetworkImage(
                                        imageUrl: Api.resprcePath +
                                            productionCompanies![index]
                                                .logoPath!,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.contain,
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                                SpinKitFoldingCube(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const MyErrorWidget(),
                                        // color: Colors.red,
                                      )
                                    : const SizedBox(),
                              ),
                              SizedBox(
                                  height: 60,
                                  child: Text(
                                    productionCompanies![index].name!,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
