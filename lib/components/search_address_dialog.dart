import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../models/address_detail.dart';
import '../providers/address_suggestions_notifier.dart';
import '../providers/providers.dart';
import '../utils/font_settings.dart';

class AddressSearchDialog extends ConsumerStatefulWidget {
  const AddressSearchDialog({super.key});

  @override
  ConsumerState<AddressSearchDialog> createState() => _AddressSearchDialogState();
}

class _AddressSearchDialogState extends ConsumerState<AddressSearchDialog> {
  final mapController = MapController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildSetButton() {
    return Positioned(
      bottom: 14,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                final addressName = ref.watch(addressNameProvider);
                final addressDetail = ref.watch(addressDetailProvider);
                if (addressDetail != null) {
                  Navigator.of(context).pop(addressDetail);
                  return;
                }
                if (addressName != "") {
                  Navigator.of(context).pop(AddressDetail(name: addressName, label: "", lon: null, lat: null));
                  return;
                }
                return Navigator.of(context).pop(AddressDetail(name: "", label: "", lon: null, lat: null));
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white54),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "Set Address",
                  style: FontSettings.primaryFont,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return Positioned(
      bottom: 14,
      right: 14,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                ref.watch(addressNameProvider.notifier).state = "";
                ref.watch(addressDetailProvider.notifier).state = null;
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white54),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.red),
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white.withOpacity(0.2),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 600),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  MapTile(
                    mapController: mapController,
                  ),
                  _buildSetButton(),
                  _buildClearButton(),
                  AddressSearchPage(
                    mapController: mapController,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MapTile extends ConsumerStatefulWidget {
  const MapTile({
    super.key,
    required this.mapController,
  });
  final MapController mapController;

  @override
  ConsumerState<MapTile> createState() => _MapTileState();
}

class _MapTileState extends ConsumerState<MapTile> {
  List<Marker> buildMarkers(LatLng latLng) {
    return [
      Marker(
        rotate: true,
        height: 28,
        width: 28,
        point: latLng,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              // border: Border.all(width: 1, color: Colors.red),
              // color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_pin,
              color: Colors.red,
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final locationLatLng = ref.watch(latLngProvider);

    return FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
        onPointerDown: (event, point) {},
        center: locationLatLng,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'com.example.fyp_our_sky_new',
          tileProvider: FlutterMapTileCaching.instance('MapTileStore').getTileProvider(),
        ),
        MarkerLayer(
          markers: buildMarkers(locationLatLng),
        ),
      ],
    );
  }
}

class AddressSearchPage extends ConsumerStatefulWidget {
  const AddressSearchPage({
    super.key,
    required this.mapController,
  });

  final MapController mapController;

  @override
  ConsumerState<AddressSearchPage> createState() => _AddressSearchPageState();
}

class _AddressSearchPageState extends ConsumerState<AddressSearchPage> {
  Timer? timer;
  String searchQuery = "";

  void startTimer(String q) {
    ref.read(addressSuggestionsProvider.notifier).searchSuggestions(q: q);
  }

  void cancelTimer() {
    setState(() {
      timer!.cancel();
    });
  }

  void clearSuggestions() {
    ref.read(addressSuggestionsProvider.notifier).initSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    final focused = ref.watch(addressSearchBarFocusedProvider);
    final addressName = ref.watch(addressNameProvider);
    // final focused = true;

    return LayoutBuilder(
      builder: (_, constraints) {
        return Stack(
          children: [
            AddressSearchButton(width: constraints.maxWidth),
            AddressSearchBarAndResultList(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              mapController: widget.mapController,
            ),
          ],
        );
      },
    );
  }
}

class AddressSearchButton extends ConsumerWidget {
  const AddressSearchButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focused = ref.watch(addressSearchBarFocusedProvider);
    final addressName = ref.watch(addressNameProvider);

    return IgnorePointer(
      ignoring: focused,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: focused ? 0 : 1,
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 80,
          width: width,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () {
                    ref.read(addressSearchBarFocusedProvider.notifier).state = true;
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: width - 20,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      border: Border.all(width: 1, color: Colors.white54),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: (width - 20 - 20 - 16) * 0.9,
                          child: Text(
                            addressName == "" ? "Search Address" : addressName,
                            style: FontSettings.primaryFont,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddressSearchBarAndResultList extends ConsumerWidget {
  const AddressSearchBarAndResultList({
    super.key,
    required this.width,
    required this.height,
    required this.mapController,
  });

  final double width;
  final double height;
  final MapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focused = ref.watch(addressSearchBarFocusedProvider);

    return IgnorePointer(
      ignoring: !focused,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: focused ? 1 : 0,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              height: height,
              width: width,
              color: Colors.black12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AddressSearchBar(
                    width: width,
                  ),
                  AddressSearchResultList(
                    mapController: mapController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddressSearchBar extends ConsumerStatefulWidget {
  const AddressSearchBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  ConsumerState<AddressSearchBar> createState() => _AddressSearchBarState();
}

class _AddressSearchBarState extends ConsumerState<AddressSearchBar> {
  Timer? timer;

  void startTimer(String q) {
    ref.read(addressSuggestionsProvider.notifier).searchSuggestions(q: q);
  }

  void cancelTimer() {
    setState(() {
      timer!.cancel();
    });
  }

  void clearSuggestions() {
    ref.read(addressSuggestionsProvider.notifier).initSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: widget.width,
      // padding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: SizedBox(
              width: widget.width - 80,
              // decoration: BoxDecoration(
              //   color: Colors.white10,
              // ),
              child: TextField(
                enableSuggestions: true,
                onChanged: (query) {
                  ref.read(addressNameProvider.notifier).state = query;
                  if (timer != null) {
                    if (timer!.isActive) {
                      cancelTimer();
                    }
                  }

                  if (query == "") {
                    clearSuggestions();
                    return;
                  }

                  timer = Timer(const Duration(seconds: 1), () {
                    startTimer(query);
                  });
                },
                onTapOutside: (event) {},
                cursorColor: Colors.white,
                style: FontSettings.primaryFont,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white24),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white60),
                  ),
                  labelText: 'Search Location',
                  labelStyle: FontSettings.primaryFont.copyWith(color: Colors.white),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  ref.read(addressSearchBarFocusedProvider.notifier).state = false;
                },
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.keyboard_backspace_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  ref.read(addressNameProvider.notifier).state = "";
                },
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressSearchResultList extends ConsumerWidget {
  const AddressSearchResultList({
    super.key,
    required this.mapController,
  });
  final MapController mapController;

  Widget buildResultTiles(List<AddressDetail> suggestions) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: ListView(
          shrinkWrap: true,
          children: suggestions
              .map((suggestion) => ResultTile(
                    name: suggestion.name,
                    label: suggestion.label,
                    lon: suggestion.lon,
                    lat: suggestion.lat,
                    mapController: mapController,
                  ))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(addressSuggestionsProvider);

    return results.when(
      data: (data) {
        return buildResultTiles(data);
      },
      error: (error, stackTrace) {
        return Container(
          child: Text("Search something?"),
        );
      },
      loading: () {
        return Expanded(
          child: Container(
            child: Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ResultTile extends ConsumerWidget {
  ResultTile({
    super.key,
    this.name = "",
    this.label = "",
    this.lon,
    this.lat,
    required this.mapController,
  });

  final String name;
  final String label;
  final double? lon;
  final double? lat;
  final MapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Material(
          elevation: 0,
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              if (lat != null && lon != null) {
                final addressDetail = AddressDetail(name: name, label: label, lat: lat, lon: lon);
                ref.read(addressDetailProvider.notifier).state = addressDetail;
                ref.read(latLngProvider.notifier).state = LatLng(lat!, lon!);
                ref.read(addressNameProvider.notifier).state = name;
                ref.read(addressSearchBarFocusedProvider.notifier).state = false;
                mapController.move(LatLng(lat!, lon!), 13);
              }
            },
            child: Container(
              padding: EdgeInsets.all(8),
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 20,
                    child: Icon(Icons.location_on_rounded, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: constraints.maxWidth - 20 - 10 - 16,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: FontSettings.primaryFont,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          label,
                          style: FontSettings.primaryFont.copyWith(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<AddressDetail?> searchAddress({
  required BuildContext context,
}) {
  return showDialog<AddressDetail?>(
    context: context,
    builder: (context) {
      return const AddressSearchDialog();
    },
  );
}
