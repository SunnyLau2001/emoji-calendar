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
    required String dateString,
  }) : this._internal(
          (ref) => dateDetailStructuredWatcher(
            ref as DateDetailStructuredWatcherRef,
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
          dateString: dateString,
        );

  DateDetailStructuredWatcherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateString,
  }) : super.internal();

  final String dateString;

  @override
  Override overrideWith(
    Stream<DateDetailStructured?> Function(
            DateDetailStructuredWatcherRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DateDetailStructuredWatcherProvider._internal(
        (ref) => create(ref as DateDetailStructuredWatcherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateString: dateString,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DateDetailStructured?> createElement() {
    return _DateDetailStructuredWatcherProviderElement(this);
  }

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

mixin DateDetailStructuredWatcherRef
    on AutoDisposeStreamProviderRef<DateDetailStructured?> {
  /// The parameter `dateString` of this provider.
  String get dateString;
}

class _DateDetailStructuredWatcherProviderElement
    extends AutoDisposeStreamProviderElement<DateDetailStructured?>
    with DateDetailStructuredWatcherRef {
  _DateDetailStructuredWatcherProviderElement(super.provider);

  @override
  String get dateString =>
      (origin as DateDetailStructuredWatcherProvider).dateString;
}

String _$multidayEventStructuredWatcherHash() =>
    r'ffec30dc79d4c667389f04f4b27a4011707af639';

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
    required int multidayEventId,
  }) : this._internal(
          (ref) => multidayEventStructuredWatcher(
            ref as MultidayEventStructuredWatcherRef,
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
          multidayEventId: multidayEventId,
        );

  MultidayEventStructuredWatcherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.multidayEventId,
  }) : super.internal();

  final int multidayEventId;

  @override
  Override overrideWith(
    Stream<MultidayEventStructured?> Function(
            MultidayEventStructuredWatcherRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MultidayEventStructuredWatcherProvider._internal(
        (ref) => create(ref as MultidayEventStructuredWatcherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        multidayEventId: multidayEventId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<MultidayEventStructured?> createElement() {
    return _MultidayEventStructuredWatcherProviderElement(this);
  }

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

mixin MultidayEventStructuredWatcherRef
    on AutoDisposeStreamProviderRef<MultidayEventStructured?> {
  /// The parameter `multidayEventId` of this provider.
  int get multidayEventId;
}

class _MultidayEventStructuredWatcherProviderElement
    extends AutoDisposeStreamProviderElement<MultidayEventStructured?>
    with MultidayEventStructuredWatcherRef {
  _MultidayEventStructuredWatcherProviderElement(super.provider);

  @override
  int get multidayEventId =>
      (origin as MultidayEventStructuredWatcherProvider).multidayEventId;
}

String _$fetchDateDetailsHash() => r'b2e9ccd25974214f0be962a0ab837a4230733829';

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
    required List<String> dateStrings,
  }) : this._internal(
          (ref) => fetchDateDetails(
            ref as FetchDateDetailsRef,
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
          dateStrings: dateStrings,
        );

  FetchDateDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dateStrings,
  }) : super.internal();

  final List<String> dateStrings;

  @override
  Override overrideWith(
    FutureOr<List<DateDetail?>> Function(FetchDateDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchDateDetailsProvider._internal(
        (ref) => create(ref as FetchDateDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dateStrings: dateStrings,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DateDetail?>> createElement() {
    return _FetchDateDetailsProviderElement(this);
  }

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

mixin FetchDateDetailsRef on AutoDisposeFutureProviderRef<List<DateDetail?>> {
  /// The parameter `dateStrings` of this provider.
  List<String> get dateStrings;
}

class _FetchDateDetailsProviderElement
    extends AutoDisposeFutureProviderElement<List<DateDetail?>>
    with FetchDateDetailsRef {
  _FetchDateDetailsProviderElement(super.provider);

  @override
  List<String> get dateStrings =>
      (origin as FetchDateDetailsProvider).dateStrings;
}

String _$fetchEventsHash() => r'b83764d6e7ce3c870d1d0024f420048e001e315f';

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
    required List<int> eventIds,
  }) : this._internal(
          (ref) => fetchEvents(
            ref as FetchEventsRef,
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
          eventIds: eventIds,
        );

  FetchEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventIds,
  }) : super.internal();

  final List<int> eventIds;

  @override
  Override overrideWith(
    FutureOr<List<Event?>> Function(FetchEventsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEventsProvider._internal(
        (ref) => create(ref as FetchEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventIds: eventIds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Event?>> createElement() {
    return _FetchEventsProviderElement(this);
  }

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

mixin FetchEventsRef on AutoDisposeFutureProviderRef<List<Event?>> {
  /// The parameter `eventIds` of this provider.
  List<int> get eventIds;
}

class _FetchEventsProviderElement
    extends AutoDisposeFutureProviderElement<List<Event?>> with FetchEventsRef {
  _FetchEventsProviderElement(super.provider);

  @override
  List<int> get eventIds => (origin as FetchEventsProvider).eventIds;
}

String _$eventWatcherHash() => r'656c371da07923fde5a63a3b4e388b20ed5768c3';

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
    required int eventIds,
  }) : this._internal(
          (ref) => eventWatcher(
            ref as EventWatcherRef,
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
          eventIds: eventIds,
        );

  EventWatcherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventIds,
  }) : super.internal();

  final int eventIds;

  @override
  Override overrideWith(
    Stream<Event?> Function(EventWatcherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EventWatcherProvider._internal(
        (ref) => create(ref as EventWatcherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventIds: eventIds,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Event?> createElement() {
    return _EventWatcherProviderElement(this);
  }

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

mixin EventWatcherRef on AutoDisposeStreamProviderRef<Event?> {
  /// The parameter `eventIds` of this provider.
  int get eventIds;
}

class _EventWatcherProviderElement
    extends AutoDisposeStreamProviderElement<Event?> with EventWatcherRef {
  _EventWatcherProviderElement(super.provider);

  @override
  int get eventIds => (origin as EventWatcherProvider).eventIds;
}

String _$checklistWatcherHash() => r'6cc5efc3cbce97caf5058a38a495ff877820c587';

/// See also [checklistWatcher].
@ProviderFor(checklistWatcher)
const checklistWatcherProvider = ChecklistWatcherFamily();

/// See also [checklistWatcher].
class ChecklistWatcherFamily extends Family<AsyncValue<Checklist?>> {
  /// See also [checklistWatcher].
  const ChecklistWatcherFamily();

  /// See also [checklistWatcher].
  ChecklistWatcherProvider call({
    required int checklistId,
  }) {
    return ChecklistWatcherProvider(
      checklistId: checklistId,
    );
  }

  @override
  ChecklistWatcherProvider getProviderOverride(
    covariant ChecklistWatcherProvider provider,
  ) {
    return call(
      checklistId: provider.checklistId,
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
  String? get name => r'checklistWatcherProvider';
}

/// See also [checklistWatcher].
class ChecklistWatcherProvider extends AutoDisposeStreamProvider<Checklist?> {
  /// See also [checklistWatcher].
  ChecklistWatcherProvider({
    required int checklistId,
  }) : this._internal(
          (ref) => checklistWatcher(
            ref as ChecklistWatcherRef,
            checklistId: checklistId,
          ),
          from: checklistWatcherProvider,
          name: r'checklistWatcherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checklistWatcherHash,
          dependencies: ChecklistWatcherFamily._dependencies,
          allTransitiveDependencies:
              ChecklistWatcherFamily._allTransitiveDependencies,
          checklistId: checklistId,
        );

  ChecklistWatcherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.checklistId,
  }) : super.internal();

  final int checklistId;

  @override
  Override overrideWith(
    Stream<Checklist?> Function(ChecklistWatcherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChecklistWatcherProvider._internal(
        (ref) => create(ref as ChecklistWatcherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        checklistId: checklistId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Checklist?> createElement() {
    return _ChecklistWatcherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChecklistWatcherProvider &&
        other.checklistId == checklistId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, checklistId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChecklistWatcherRef on AutoDisposeStreamProviderRef<Checklist?> {
  /// The parameter `checklistId` of this provider.
  int get checklistId;
}

class _ChecklistWatcherProviderElement
    extends AutoDisposeStreamProviderElement<Checklist?>
    with ChecklistWatcherRef {
  _ChecklistWatcherProviderElement(super.provider);

  @override
  int get checklistId => (origin as ChecklistWatcherProvider).checklistId;
}

String _$fetchMultidayEventsDetailHash() =>
    r'2a61c509d6a98ca8e1640e8ff828f4d9565cb31e';

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
    required List<int> multidayEventsIds,
  }) : this._internal(
          (ref) => fetchMultidayEventsDetail(
            ref as FetchMultidayEventsDetailRef,
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
          multidayEventsIds: multidayEventsIds,
        );

  FetchMultidayEventsDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.multidayEventsIds,
  }) : super.internal();

  final List<int> multidayEventsIds;

  @override
  Override overrideWith(
    FutureOr<List<MultidayEvent?>> Function(
            FetchMultidayEventsDetailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMultidayEventsDetailProvider._internal(
        (ref) => create(ref as FetchMultidayEventsDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        multidayEventsIds: multidayEventsIds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MultidayEvent?>> createElement() {
    return _FetchMultidayEventsDetailProviderElement(this);
  }

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

mixin FetchMultidayEventsDetailRef
    on AutoDisposeFutureProviderRef<List<MultidayEvent?>> {
  /// The parameter `multidayEventsIds` of this provider.
  List<int> get multidayEventsIds;
}

class _FetchMultidayEventsDetailProviderElement
    extends AutoDisposeFutureProviderElement<List<MultidayEvent?>>
    with FetchMultidayEventsDetailRef {
  _FetchMultidayEventsDetailProviderElement(super.provider);

  @override
  List<int> get multidayEventsIds =>
      (origin as FetchMultidayEventsDetailProvider).multidayEventsIds;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
