// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contentControllerHash() => r'31b82e9bad38a911e79fe97753c248bb66c69451';

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

abstract class _$ContentController
    extends BuildlessAutoDisposeAsyncNotifier<ContentManager> {
  late final ContentManager test;

  FutureOr<ContentManager> build(
    ContentManager test,
  );
}

/// See also [ContentController].
@ProviderFor(ContentController)
const contentControllerProvider = ContentControllerFamily();

/// See also [ContentController].
class ContentControllerFamily extends Family<AsyncValue<ContentManager>> {
  /// See also [ContentController].
  const ContentControllerFamily();

  /// See also [ContentController].
  ContentControllerProvider call(
    ContentManager test,
  ) {
    return ContentControllerProvider(
      test,
    );
  }

  @override
  ContentControllerProvider getProviderOverride(
    covariant ContentControllerProvider provider,
  ) {
    return call(
      provider.test,
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
  String? get name => r'contentControllerProvider';
}

/// See also [ContentController].
class ContentControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ContentController, ContentManager> {
  /// See also [ContentController].
  ContentControllerProvider(
    ContentManager test,
  ) : this._internal(
          () => ContentController()..test = test,
          from: contentControllerProvider,
          name: r'contentControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contentControllerHash,
          dependencies: ContentControllerFamily._dependencies,
          allTransitiveDependencies:
              ContentControllerFamily._allTransitiveDependencies,
          test: test,
        );

  ContentControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.test,
  }) : super.internal();

  final ContentManager test;

  @override
  FutureOr<ContentManager> runNotifierBuild(
    covariant ContentController notifier,
  ) {
    return notifier.build(
      test,
    );
  }

  @override
  Override overrideWith(ContentController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContentControllerProvider._internal(
        () => create()..test = test,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        test: test,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ContentController, ContentManager>
      createElement() {
    return _ContentControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContentControllerProvider && other.test == test;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, test.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ContentControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ContentManager> {
  /// The parameter `test` of this provider.
  ContentManager get test;
}

class _ContentControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ContentController,
        ContentManager> with ContentControllerRef {
  _ContentControllerProviderElement(super.provider);

  @override
  ContentManager get test => (origin as ContentControllerProvider).test;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
