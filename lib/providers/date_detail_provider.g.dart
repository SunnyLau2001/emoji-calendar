// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateDetailStructuredWatcherHash() =>
    r'2894cd2057bc5f046db6fc1d458b11d4830fb22f';

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

typedef DateDetailStructuredWatcherRef
    = AutoDisposeStreamProviderRef<DateDetailStructured?>;

/// See also [dateDetailStructuredWatcher].
@ProviderFor(dateDetailStructuredWatcher)
const dateDetailStructuredWatcherProvider = DateDetailStructuredWatcherFamily();

/// See also [dateDetailStructuredWatcher].
class DateDetailStructuredWatcherFamily
    extends Family<AsyncValue<DateDetailStructured?>> {
  /// See also [dateDetailStructuredWatcher].
  const DateDetailStructuredWatcherFamily();

  /// See also [dateDetailStructuredWatcher].
  DateDetailStructuredWatcherProvider call({
    required String dateString,
  }) {
    return DateDetailStructuredWatcherProvider(
      dateString: dateString,
    );
  }

  @override
  DateDetailStructuredWatcherProvider getProviderOverride(
    covariant DateDetailStructuredWatcherProvider provider,
  ) {
    return call(
      dateString: provider.dateString,
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
  String? get name => r'dateDetailStructuredWatcherProvider';
}

/// See also [dateDetailStructuredWatcher].
class DateDetailStructuredWatcherProvider
    extends AutoDisposeStreamProvider<DateDetailStructured?> {
  /// See also [dateDetailStructuredWatcher].
  DateDetailStructuredWatcherProvider({
    required this.dateString,
  }) : super.internal(
          (ref) => dateDetailStructuredWatcher(
            ref,
            dateString: dateString,
          ),
          from: dateDetailStructuredWatcherProvider,
          name: r'dateDetailStructuredWatcherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateDetailStructuredWatcherHash,
          dependencies: DateDetailStructuredWatcherFamily._dependencies,
          allTransitiveDependencies:
              DateDetailStructuredWatcherFamily._allTransitiveDependencies,
        );

  final String dateString;

  @override
  bool operator ==(Object other) {
    return other is DateDetailStructuredWatcherProvider &&
        other.dateString == dateString;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateString.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchEventsHash() => r'b83764d6e7ce3c870d1d0024f420048e001e315f';
typedef FetchEventsRef = AutoDisposeFutureProviderRef<List<Event?>>;

/// See also [fetchEvents].
@ProviderFor(fetchEvents)
const fetchEventsProvider = FetchEventsFamily();

/// See also [fetchEvents].
class FetchEventsFamily extends Family<AsyncValue<List<Event?>>> {
  /// See also [fetchEvents].
  const FetchEventsFamily();

  /// See also [fetchEvents].
  FetchEventsProvider call({
    required List<int> eventIds,
  }) {
    return FetchEventsProvider(
      eventIds: eventIds,
    );
  }

  @override
  FetchEventsProvider getProviderOverride(
    covariant FetchEventsProvider provider,
  ) {
    return call(
      eventIds: provider.eventIds,
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
  String? get name => r'fetchEventsProvider';
}

/// See also [fetchEvents].
class FetchEventsProvider extends AutoDisposeFutureProvider<List<Event?>> {
  /// See also [fetchEvents].
  FetchEventsProvider({
    required this.eventIds,
  }) : super.internal(
          (ref) => fetchEvents(
            ref,
            eventIds: eventIds,
          ),
          from: fetchEventsProvider,
          name: r'fetchEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchEventsHash,
          dependencies: FetchEventsFamily._dependencies,
          allTransitiveDependencies:
              FetchEventsFamily._allTransitiveDependencies,
        );

  final List<int> eventIds;

  @override
  bool operator ==(Object other) {
    return other is FetchEventsProvider && other.eventIds == eventIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchMultidayEventsDetailHash() =>
    r'2a61c509d6a98ca8e1640e8ff828f4d9565cb31e';
typedef FetchMultidayEventsDetailRef
    = AutoDisposeFutureProviderRef<List<MultidayEvent?>>;

/// See also [fetchMultidayEventsDetail].
@ProviderFor(fetchMultidayEventsDetail)
const fetchMultidayEventsDetailProvider = FetchMultidayEventsDetailFamily();

/// See also [fetchMultidayEventsDetail].
class FetchMultidayEventsDetailFamily
    extends Family<AsyncValue<List<MultidayEvent?>>> {
  /// See also [fetchMultidayEventsDetail].
  const FetchMultidayEventsDetailFamily();

  /// See also [fetchMultidayEventsDetail].
  FetchMultidayEventsDetailProvider call({
    required List<int> multidayEventsIds,
  }) {
    return FetchMultidayEventsDetailProvider(
      multidayEventsIds: multidayEventsIds,
    );
  }

  @override
  FetchMultidayEventsDetailProvider getProviderOverride(
    covariant FetchMultidayEventsDetailProvider provider,
  ) {
    return call(
      multidayEventsIds: provider.multidayEventsIds,
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
  String? get name => r'fetchMultidayEventsDetailProvider';
}

/// See also [fetchMultidayEventsDetail].
class FetchMultidayEventsDetailProvider
    extends AutoDisposeFutureProvider<List<MultidayEvent?>> {
  /// See also [fetchMultidayEventsDetail].
  FetchMultidayEventsDetailProvider({
    required this.multidayEventsIds,
  }) : super.internal(
          (ref) => fetchMultidayEventsDetail(
            ref,
            multidayEventsIds: multidayEventsIds,
          ),
          from: fetchMultidayEventsDetailProvider,
          name: r'fetchMultidayEventsDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMultidayEventsDetailHash,
          dependencies: FetchMultidayEventsDetailFamily._dependencies,
          allTransitiveDependencies:
              FetchMultidayEventsDetailFamily._allTransitiveDependencies,
        );

  final List<int> multidayEventsIds;

  @override
  bool operator ==(Object other) {
    return other is FetchMultidayEventsDetailProvider &&
        other.multidayEventsIds == multidayEventsIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, multidayEventsIds.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
