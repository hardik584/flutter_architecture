import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/core/constant/dimensions.dart';
import 'package:demo/core/widgets/shimmer_widget.dart';
import 'package:demo/di/injector.dart';
import 'package:demo/features/gallery_view/data/model/album_model.dart';
import 'package:demo/features/gallery_view/presentation/bloc/gallery_view_bloc.dart';
import 'package:demo/features/gallery_view/presentation/bloc/gallery_view_event.dart';
import 'package:demo/features/gallery_view/presentation/bloc/gallery_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  GalleryViewBloc galleryViewBloc = sl<GalleryViewBloc>();
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 10,
    keepScrollOffset: true,
  );
  @override
  void initState() {
    galleryViewBloc.add(FetchCacheData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery View'),
        actions: [
          IconButton(onPressed: (){
            runApp(MaterialApp(
              title: 'Flutter Second Demo',
              home: Scaffold(appBar: AppBar(backgroundColor: Colors.red,),body: Column(
                children: [
                  IconButton(onPressed: (){
                    runApp(MaterialApp(
                      title: 'Flutter Second Demo',
                      home: Scaffold(appBar: AppBar(backgroundColor: Colors.orange,),body: Column(
                        children: [
                          IconButton(onPressed: (){

                          }, icon: Icon(Icons.abc_outlined)),
                        ],
                      )),

                    ));
                  }, icon: Icon(Icons.abc_outlined)),
                ],
              )),

            ));
          }, icon:const Icon(Icons.abc))
        ],
      ),
      body: BlocConsumer<GalleryViewBloc, GalleryViewState>(
        bloc: galleryViewBloc,
        listener: (BuildContext context, GalleryViewState state) {
          if (state is GalleryViewSuccessState) {
            if (galleryViewBloc.galleryList.isNotEmpty) {
              AlbumModel albumModel = galleryViewBloc.galleryList.first.album;
              galleryViewBloc.add(FetchPhotos(albumModel.id ?? 0));
            }
          } else if (state is GalleryViewPhotoSuccessState) {
            if (state.id < galleryViewBloc.galleryList.last.id) {
              galleryViewBloc.add(FetchPhotos(state.id + 1));
            }
          }
        },
        builder: (BuildContext context, GalleryViewState state) {
          return galleryViewBloc.galleryList.isEmpty
              ? const Offstage()
              : ListView.builder(
                  padding: const EdgeInsets.all(Dimens.spaceXlarge),
                  controller: scrollController,
                  itemBuilder: (BuildContext context, index) {
                    final i = index % galleryViewBloc.galleryList.length;
                    AlbumModel albumModel =
                        galleryViewBloc.galleryList[i].album;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: Dimens.spaceXXNormal),
                        state is GalleryViewLoadingState
                            ? const ShimmerWidget.rectangular(
                                width: 30, height: 15)
                            : Text('Album $i ${albumModel.title.toString()}'),
                        const SizedBox(height: Dimens.spaceXXNormal),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, ind) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: galleryViewBloc
                                          .galleryList[i].photoList.isEmpty
                                      ? ShimmerWidget.rectangular(
                                          width: 100,
                                          height: 100,
                                          shapeBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ))
                                      : CachedNetworkImage(
                                          imageUrl: galleryViewBloc
                                                  .galleryList[i]
                                                  .photoList[ind %
                                                      galleryViewBloc
                                                          .galleryList[i]
                                                          .photoList
                                                          .length]
                                                  .url ??
                                              '',
                                          placeholder: (context, url) =>
                                              ShimmerWidget.rectangular(
                                                  width: 100,
                                                  height: 100,
                                                  shapeBorder:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8))),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                );
                              }),
                        )
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
