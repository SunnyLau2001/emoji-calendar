// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateDetailStructuredWatcherHash() =>
    r'68e6c530791078cb81a115dd78ed1d1609fd8a34';

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

String _$multidayEventStructuredWatcherHash() =>
    r'8a00bd063e2f4fc7f903b1f972cf6c930737afb3';
typedef MultidayEventStructuredWatcherRef
    = AutoDisposeStreamProviderRef<MultidayEventStructured?>;

/// See also [multidayEventStructuredWatcher].
@ProviderFor(multidayEventStructuredWatcher)
const multidayEventStructuredWatcherProvider =
    MultidayEventStructuredWatcherFamily();

/// See also [multidayEventStructuredWatcher].
class MultidayEventStructuredWatcherFamily
    extends Family<AsyncValue<MultidayEventStructured?>> {
  /// See also [multidayEventStructuredWatcher].
  const MultidayEventStructuredWatcherFamily();

  /// See also [multidayEventStructuredWatcher].
  MultidayEventStructuredWatcherProvider call({
    required int multidayEventId,
  }) {
    return MultidayEventStructuredWatcherProvider(
      multidayEventId: multidayEventId,
    );
  }

  @override
  MultidayEventStructuredWatcherProvider getProviderOverride(
    covariant MultidayEventStructuredWatcherProvider provider,
  ) {
    return call(
      multidayEventId: provider.multidayEventId,
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
  String? get name => r'multidayEventStructuredWatcherProvider';
}

/// See also [multidayEventStructuredWatcher].
class MultidayEventStructuredWatcherProvider
    extends AutoDisposeStreamProvider<MultidayEventStructured?> {
  /// See also [multidayEventStructuredWatcher].
  MultidayEventStructuredWatcherProvider({
    required this.multidayEventId,
  }) : super.internal(
          (ref) => multidayEventStructuredWatcher(
            ref,
            multidayEventId: multidayEventId,
          ),
          from: multidayEventStructuredWatcherProvider,
          name: r'multidayEventStructuredWatcherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$multidayEventStructuredWatcherHash,
          dependencies: MultidayEventStructuredWatcherFamily._dependencies,
          allTransitiveDependencies:
              MultidayEventStructuredWatcherFamily._allTransitiveDependencies,
        );

  final int multidayEventId;

  @override
  bool operator ==(Object other) {
    return other is MultidayEventStructuredWatcherProvider &&
        other.multidayEventId == multidayEventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, multidayEventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fetchDateDetailsHash() => r'b2e9ccd25974214f0be962a0ab837a4230733829';
typedef FetchDateDetailsRef = AutoDisposeFutureProviderRef<List<DateDetail?>>;

/// See also [fetchDateDetails].
@ProviderFor(fetchDateDetails)
const fetchDateDetailsProvider = FetchDateDetailsFamily();

/// See also [fetchDateDetails].
class FetchDateDetailsFamily extends Family<AsyncValue<List<DateDetail?>>> {
  /// See also [fetchDateDetails].
  const FetchDateDetailsFamily();

  /// See also [fetchDateDetails].
  FetchDateDetailsProvider call({
    required List<String> dateStrings,
  }) {
    return FetchDateDetailsProvider(
      dateStrings: dateStrings,
    );
  }

  @override
  FetchDateDetailsProvider getProviderOverride(
    covariant FetchDateDetailsProvider provider,
  ) {
    return call(
      dateStrings: provider.dateStrings,
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
  String? get name => r'fetchDateDetailsProvider';
}

/// See also [fetchDateDetails].
class FetchDateDetailsProvider
    extends AutoDisposeFutureProvider<List<DateDetail?>> {
  /// See also [fetchDateDetails].
  FetchDateDetailsProvider({
    required this.dateStrings,
  }) : super.internal(
          (ref) => fetchDateDetails(
            ref,
            dateStrings: dateStrings,
          ),
          from: fetchDateDetailsProvider,
          name: r'fetchDateDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchDateDetailsHash,
          dependencies: FetchDateDetailsFamily._dependencies,
          allTransitiveDependencies:
              FetchDateDetailsFamily._allTransitiveDependencies,
        );

  final List<String> dateStrings;

  @override
  bool operator ==(Object other) {
    return other is FetchDateDetailsProvider &&
        other.dateStrings == dateStrings;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateStrings.hashCode);

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

String _$eventWatcherHash() => r'656c371da07923fde5a63a3b4e388b20ed5768c3';
typedef EventWatcherRef = AutoDisposeStreamProviderRef<Event?>;

/// See also [eventWatcher].
@ProviderFor(eventWatcher)
const eventWatcherProvider = EventWatcherFamily();

/// See also [eventWatcher].
class EventWatcherFamily extends Family<AsyncValue<Event?>> {
  /// See also [eventWatcher].
  const EventWatcherFamily();

  /// See also [eventWatcher].
  EventWatcherProvider call({
    required int eventIds,
  }) {
    return EventWatcherProvider(
      eventIds: eventIds,
    );
  }

  @override
  EventWatcherProvider getProviderOverride(
    covariant EventWatcherProvider provider,
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
  String? get name => r'eventWatcherProvider';
}

/// See also [eventWatcher].
class EventWatcherProvider extends AutoDisposeStreamProvider<Event?> {
  /// See also [eventWatcher].
  EventWatcherProvider({
    required this.eventIds,
  }) : super.internal(
          (ref) => eventWatcher(
            ref,
            eventIds: eventIds,
          ),
          from: eventWatcherProvider,
          name: r'eventWatcherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventWatcherHash,
          dependencies: EventWatcherFamily._dependencies,
          allTransitiveDependencies:
              EventWatcherFamily._allTransitiveDependencies,
        );

  final int eventIds;

  @override
  bool operator ==(Object other) {
    return other is EventWatcherProvider && other.eventIds == eventIds;
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
