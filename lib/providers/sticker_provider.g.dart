// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchStickersHash() => r'e2e0fbef5bb185b395188ee3ef03638a6e59d287';

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
String _$fetchStickerByIdHash() => r'931117dd3343f32ed52215319913bab988829a26';

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
    required String stickerId,
  }) : this._internal(
          (ref) => fetchStickerById(
            ref as FetchStickerByIdRef,
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
          stickerId: stickerId,
        );

  FetchStickerByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stickerId,
  }) : super.internal();

  final String stickerId;

  @override
  Override overrideWith(
    FutureOr<Sticker?> Function(FetchStickerByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchStickerByIdProvider._internal(
        (ref) => create(ref as FetchStickerByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stickerId: stickerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Sticker?> createElement() {
    return _FetchStickerByIdProviderElement(this);
  }

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

mixin FetchStickerByIdRef on AutoDisposeFutureProviderRef<Sticker?> {
  /// The parameter `stickerId` of this provider.
  String get stickerId;
}

class _FetchStickerByIdProviderElement
    extends AutoDisposeFutureProviderElement<Sticker?>
    with FetchStickerByIdRef {
  _FetchStickerByIdProviderElement(super.provider);

  @override
  String get stickerId => (origin as FetchStickerByIdProvider).stickerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
