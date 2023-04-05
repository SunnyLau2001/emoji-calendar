// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchStickersHash() => r'4eb19c316895a25684409e682ae2c76e9aafe773';

/// See also [fetchStickers].
@ProviderFor(fetchStickers)
final fetchStickersProvider = AutoDisposeFutureProvider<List<Sticker>>.internal(
  fetchStickers,
  name: r'fetchStickersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchStickersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchStickersRef = AutoDisposeFutureProviderRef<List<Sticker>>;
String _$fetchStickerByIdHash() => r'cc1829255099d825f49f53ed7024821e2fb93670';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchStickerByIdRef = AutoDisposeFutureProviderRef<Sticker?>;

/// See also [fetchStickerById].
@ProviderFor(fetchStickerById)
const fetchStickerByIdProvider = FetchStickerByIdFamily();

/// See also [fetchStickerById].
class FetchStickerByIdFamily extends Family<AsyncValue<Sticker?>> {
  /// See also [fetchStickerById].
  const FetchStickerByIdFamily();

  /// See also [fetchStickerById].
  FetchStickerByIdProvider call({
    required String stickerId,
  }) {
    return FetchStickerByIdProvider(
      stickerId: stickerId,
    );
  }

  @override
  FetchStickerByIdProvider getProviderOverride(
    covariant FetchStickerByIdProvider provider,
  ) {
    return call(
      stickerId: provider.stickerId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchStickerByIdProvider';
}

/// See also [fetchStickerById].
class FetchStickerByIdProvider extends AutoDisposeFutureProvider<Sticker?> {
  /// See also [fetchStickerById].
  FetchStickerByIdProvider({
    required this.stickerId,
  }) : super.internal(
          (ref) => fetchStickerById(
            ref,
            stickerId: stickerId,
          ),
          from: fetchStickerByIdProvider,
          name: r'fetchStickerByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchStickerByIdHash,
          dependencies: FetchStickerByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchStickerByIdFamily._allTransitiveDependencies,
        );

  final String stickerId;

  @override
  bool operator ==(Object other) {
    return other is FetchStickerByIdProvider && other.stickerId == stickerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stickerId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
