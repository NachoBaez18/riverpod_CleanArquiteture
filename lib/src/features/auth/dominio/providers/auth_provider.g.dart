// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRemoteDataHash() => r'f3368fdba743a8b2488fac1bae61b2655107a5cc';

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

typedef AuthRemoteDataRef
    = AutoDisposeProviderRef<AuthenticationRemoteDataSource>;

/// See also [authRemoteData].
@ProviderFor(authRemoteData)
const authRemoteDataProvider = AuthRemoteDataFamily();

/// See also [authRemoteData].
class AuthRemoteDataFamily extends Family<AuthenticationRemoteDataSource> {
  /// See also [authRemoteData].
  const AuthRemoteDataFamily();

  /// See also [authRemoteData].
  AuthRemoteDataProvider call({
    required NetworkService networkService,
  }) {
    return AuthRemoteDataProvider(
      networkService: networkService,
    );
  }

  @override
  AuthRemoteDataProvider getProviderOverride(
    covariant AuthRemoteDataProvider provider,
  ) {
    return call(
      networkService: provider.networkService,
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
  String? get name => r'authRemoteDataProvider';
}

/// See also [authRemoteData].
class AuthRemoteDataProvider
    extends AutoDisposeProvider<AuthenticationRemoteDataSource> {
  /// See also [authRemoteData].
  AuthRemoteDataProvider({
    required this.networkService,
  }) : super.internal(
          (ref) => authRemoteData(
            ref,
            networkService: networkService,
          ),
          from: authRemoteDataProvider,
          name: r'authRemoteDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authRemoteDataHash,
          dependencies: AuthRemoteDataFamily._dependencies,
          allTransitiveDependencies:
              AuthRemoteDataFamily._allTransitiveDependencies,
        );

  final NetworkService networkService;

  @override
  bool operator ==(Object other) {
    return other is AuthRemoteDataProvider &&
        other.networkService == networkService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, networkService.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$authRepositoryHash() => r'0f175c67fd093b0165187f80ab769fa765955821';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<UserDataRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<UserDataRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
