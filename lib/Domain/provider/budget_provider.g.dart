// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$budgetNotifierHash() => r'66a95912faf70a4b21e3717ae8e78417de0d884c';

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

abstract class _$BudgetNotifier extends BuildlessAsyncNotifier<Budget> {
  late final tripId;

  FutureOr<Budget> build(
    tripId,
  );
}

/// See also [BudgetNotifier].
@ProviderFor(BudgetNotifier)
const budgetNotifierProvider = BudgetNotifierFamily();

/// See also [BudgetNotifier].
class BudgetNotifierFamily extends Family<AsyncValue<Budget>> {
  /// See also [BudgetNotifier].
  const BudgetNotifierFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'budgetNotifierProvider';

  /// See also [BudgetNotifier].
  BudgetNotifierProvider call(
    tripId,
  ) {
    return BudgetNotifierProvider(
      tripId,
    );
  }

  @visibleForOverriding
  @override
  BudgetNotifierProvider getProviderOverride(
    covariant BudgetNotifierProvider provider,
  ) {
    return call(
      provider.tripId,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(BudgetNotifier Function() create) {
    return _$BudgetNotifierFamilyOverride(this, create);
  }
}

class _$BudgetNotifierFamilyOverride
    implements FamilyOverride<AsyncValue<Budget>> {
  _$BudgetNotifierFamilyOverride(this.overriddenFamily, this.create);

  final BudgetNotifier Function() create;

  @override
  final BudgetNotifierFamily overriddenFamily;

  @override
  BudgetNotifierProvider getProviderOverride(
    covariant BudgetNotifierProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [BudgetNotifier].
class BudgetNotifierProvider
    extends AsyncNotifierProviderImpl<BudgetNotifier, Budget> {
  /// See also [BudgetNotifier].
  BudgetNotifierProvider(
    tripId,
  ) : this._internal(
          () => BudgetNotifier()..tripId = tripId,
          from: budgetNotifierProvider,
          name: r'budgetNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$budgetNotifierHash,
          dependencies: BudgetNotifierFamily._dependencies,
          allTransitiveDependencies:
              BudgetNotifierFamily._allTransitiveDependencies,
          tripId: tripId,
        );

  BudgetNotifierProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tripId,
  }) : super.internal();

  final tripId;

  @override
  FutureOr<Budget> runNotifierBuild(
    covariant BudgetNotifier notifier,
  ) {
    return notifier.build(
      tripId,
    );
  }

  @override
  Override overrideWith(BudgetNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: BudgetNotifierProvider._internal(
        () => create()..tripId = tripId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tripId: tripId,
      ),
    );
  }

  @override
  (dynamic,) get argument {
    return (tripId,);
  }

  @override
  AsyncNotifierProviderElement<BudgetNotifier, Budget> createElement() {
    return _BudgetNotifierProviderElement(this);
  }

  BudgetNotifierProvider _copyWith(
    BudgetNotifier Function() create,
  ) {
    return BudgetNotifierProvider._internal(
      () => create()..tripId = tripId,
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      tripId: tripId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BudgetNotifierProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BudgetNotifierRef on AsyncNotifierProviderRef<Budget> {
  /// The parameter `tripId` of this provider.
  get tripId;
}

class _BudgetNotifierProviderElement
    extends AsyncNotifierProviderElement<BudgetNotifier, Budget>
    with BudgetNotifierRef {
  _BudgetNotifierProviderElement(super.provider);

  @override
  get tripId => (origin as BudgetNotifierProvider).tripId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
