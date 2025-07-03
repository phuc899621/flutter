// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $UserTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [localId, remoteId, email, name, avatar];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'user';

  @override
  VerificationContext validateIntegrity(Insertable<UserTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};

  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int localId;
  final String remoteId;
  final String email;
  final String name;
  final String avatar;

  const UserTableData(
      {required this.localId,
      required this.remoteId,
      required this.email,
      required this.name,
      required this.avatar});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['email'] = Variable<String>(email);
    map['name'] = Variable<String>(name);
    map['avatar'] = Variable<String>(avatar);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      email: Value(email),
      name: Value(name),
      avatar: Value(avatar),
    );
  }

  factory UserTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      email: serializer.fromJson<String>(json['email']),
      name: serializer.fromJson<String>(json['name']),
      avatar: serializer.fromJson<String>(json['avatar']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'email': serializer.toJson<String>(email),
      'name': serializer.toJson<String>(name),
      'avatar': serializer.toJson<String>(avatar),
    };
  }

  UserTableData copyWith(
          {int? localId,
          String? remoteId,
          String? email,
          String? name,
          String? avatar}) =>
      UserTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        email: email ?? this.email,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
      );

  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      email: data.email.present ? data.email.value : this.email,
      name: data.name.present ? data.name.value : this.name,
      avatar: data.avatar.present ? data.avatar.value : this.avatar,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, remoteId, email, name, avatar);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.email == this.email &&
          other.name == this.name &&
          other.avatar == this.avatar);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> email;
  final Value<String> name;
  final Value<String> avatar;

  const UserTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.email = const Value.absent(),
    this.name = const Value.absent(),
    this.avatar = const Value.absent(),
  });

  UserTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String email,
    required String name,
    required String avatar,
  })  : email = Value(email),
        name = Value(name),
        avatar = Value(avatar);

  static Insertable<UserTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? email,
    Expression<String>? name,
    Expression<String>? avatar,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      if (avatar != null) 'avatar': avatar,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? email,
      Value<String>? name,
      Value<String>? avatar}) {
    return UserTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      email: email ?? this.email,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('avatar: $avatar')
          ..write(')'))
        .toString();
  }
}

class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $CategoryTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _userLocalIdMeta =
      const VerificationMeta('userLocalId');
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
      'user_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user (local_id) ON DELETE CASCADE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);

  @override
  List<GeneratedColumn> get $columns =>
      [localId, remoteId, name, isSynced, userLocalId, createdAt, updatedAt];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'category';

  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
          _userLocalIdMeta,
          userLocalId.isAcceptableOrUnknown(
              data['user_local_id']!, _userLocalIdMeta));
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};

  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      userLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_local_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int localId;
  final String remoteId;
  final String name;
  final bool isSynced;
  final int userLocalId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CategoryTableData(
      {required this.localId,
      required this.remoteId,
      required this.name,
      required this.isSynced,
      required this.userLocalId,
      required this.createdAt,
      required this.updatedAt});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['name'] = Variable<String>(name);
    map['is_synced'] = Variable<bool>(isSynced);
    map['user_local_id'] = Variable<int>(userLocalId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      name: Value(name),
      isSynced: Value(isSynced),
      userLocalId: Value(userLocalId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      name: serializer.fromJson<String>(json['name']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'name': serializer.toJson<String>(name),
      'isSynced': serializer.toJson<bool>(isSynced),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CategoryTableData copyWith(
          {int? localId,
          String? remoteId,
          String? name,
          bool? isSynced,
          int? userLocalId,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      CategoryTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        name: name ?? this.name,
        isSynced: isSynced ?? this.isSynced,
        userLocalId: userLocalId ?? this.userLocalId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  CategoryTableData copyWithCompanion(CategoryTableCompanion data) {
    return CategoryTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      name: data.name.present ? data.name.value : this.name,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isSynced: $isSynced, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      localId, remoteId, name, isSynced, userLocalId, createdAt, updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.name == this.name &&
          other.isSynced == this.isSynced &&
          other.userLocalId == this.userLocalId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> name;
  final Value<bool> isSynced;
  final Value<int> userLocalId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;

  const CategoryTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.name = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });

  CategoryTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String name,
    this.isSynced = const Value.absent(),
    required int userLocalId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        userLocalId = Value(userLocalId);

  static Insertable<CategoryTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? name,
    Expression<bool>? isSynced,
    Expression<int>? userLocalId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (name != null) 'name': name,
      if (isSynced != null) 'is_synced': isSynced,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? name,
      Value<bool>? isSynced,
      Value<int>? userLocalId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CategoryTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      isSynced: isSynced ?? this.isSynced,
      userLocalId: userLocalId ?? this.userLocalId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isSynced: $isSynced, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $TaskTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _categoryLocalIdMeta =
      const VerificationMeta('categoryLocalId');
  @override
  late final GeneratedColumn<int> categoryLocalId = GeneratedColumn<int>(
      'category_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category (local_id)'));
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('none'));
  static const VerificationMeta _userLocalIdMeta =
      const VerificationMeta('userLocalId');
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
      'user_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user (local_id) ON DELETE CASCADE'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _hasTimeMeta =
      const VerificationMeta('hasTime');
  @override
  late final GeneratedColumn<bool> hasTime = GeneratedColumn<bool>(
      'has_time', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_time" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);

  @override
  List<GeneratedColumn> get $columns => [
        localId,
        remoteId,
        title,
        description,
        categoryLocalId,
        isSynced,
        priority,
        userLocalId,
        status,
        dueDate,
        completedAt,
        hasTime,
        createdAt,
        updatedAt
      ];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'task';

  @override
  VerificationContext validateIntegrity(Insertable<TaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('category_local_id')) {
      context.handle(
          _categoryLocalIdMeta,
          categoryLocalId.isAcceptableOrUnknown(
              data['category_local_id']!, _categoryLocalIdMeta));
    } else if (isInserting) {
      context.missing(_categoryLocalIdMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
          _userLocalIdMeta,
          userLocalId.isAcceptableOrUnknown(
              data['user_local_id']!, _userLocalIdMeta));
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('has_time')) {
      context.handle(_hasTimeMeta,
          hasTime.isAcceptableOrUnknown(data['has_time']!, _hasTimeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};

  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      categoryLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_local_id'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      userLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_local_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      hasTime: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_time'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final int localId;
  final String remoteId;
  final String title;
  final String description;
  final int categoryLocalId;
  final bool isSynced;
  final String priority;
  final int userLocalId;
  final String status;
  final DateTime? dueDate;
  final DateTime? completedAt;
  final bool hasTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TaskTableData(
      {required this.localId,
      required this.remoteId,
      required this.title,
      required this.description,
      required this.categoryLocalId,
      required this.isSynced,
      required this.priority,
      required this.userLocalId,
      required this.status,
      this.dueDate,
      this.completedAt,
      required this.hasTime,
      required this.createdAt,
      required this.updatedAt});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['category_local_id'] = Variable<int>(categoryLocalId);
    map['is_synced'] = Variable<bool>(isSynced);
    map['priority'] = Variable<String>(priority);
    map['user_local_id'] = Variable<int>(userLocalId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['has_time'] = Variable<bool>(hasTime);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      title: Value(title),
      description: Value(description),
      categoryLocalId: Value(categoryLocalId),
      isSynced: Value(isSynced),
      priority: Value(priority),
      userLocalId: Value(userLocalId),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      hasTime: Value(hasTime),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      categoryLocalId: serializer.fromJson<int>(json['categoryLocalId']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      priority: serializer.fromJson<String>(json['priority']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      status: serializer.fromJson<String>(json['status']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      hasTime: serializer.fromJson<bool>(json['hasTime']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'categoryLocalId': serializer.toJson<int>(categoryLocalId),
      'isSynced': serializer.toJson<bool>(isSynced),
      'priority': serializer.toJson<String>(priority),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'status': serializer.toJson<String>(status),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'hasTime': serializer.toJson<bool>(hasTime),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TaskTableData copyWith(
          {int? localId,
          String? remoteId,
          String? title,
          String? description,
          int? categoryLocalId,
          bool? isSynced,
          String? priority,
          int? userLocalId,
          String? status,
          Value<DateTime?> dueDate = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          bool? hasTime,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TaskTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        title: title ?? this.title,
        description: description ?? this.description,
        categoryLocalId: categoryLocalId ?? this.categoryLocalId,
        isSynced: isSynced ?? this.isSynced,
        priority: priority ?? this.priority,
        userLocalId: userLocalId ?? this.userLocalId,
        status: status ?? this.status,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        hasTime: hasTime ?? this.hasTime,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      categoryLocalId: data.categoryLocalId.present
          ? data.categoryLocalId.value
          : this.categoryLocalId,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      priority: data.priority.present ? data.priority.value : this.priority,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      hasTime: data.hasTime.present ? data.hasTime.value : this.hasTime,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('categoryLocalId: $categoryLocalId, ')
          ..write('isSynced: $isSynced, ')
          ..write('priority: $priority, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('completedAt: $completedAt, ')
          ..write('hasTime: $hasTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      localId,
      remoteId,
      title,
      description,
      categoryLocalId,
      isSynced,
      priority,
      userLocalId,
      status,
      dueDate,
      completedAt,
      hasTime,
      createdAt,
      updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.title == this.title &&
          other.description == this.description &&
          other.categoryLocalId == this.categoryLocalId &&
          other.isSynced == this.isSynced &&
          other.priority == this.priority &&
          other.userLocalId == this.userLocalId &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.completedAt == this.completedAt &&
          other.hasTime == this.hasTime &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> title;
  final Value<String> description;
  final Value<int> categoryLocalId;
  final Value<bool> isSynced;
  final Value<String> priority;
  final Value<int> userLocalId;
  final Value<String> status;
  final Value<DateTime?> dueDate;
  final Value<DateTime?> completedAt;
  final Value<bool> hasTime;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;

  const TaskTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryLocalId = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.priority = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.hasTime = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });

  TaskTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required int categoryLocalId,
    this.isSynced = const Value.absent(),
    this.priority = const Value.absent(),
    required int userLocalId,
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.hasTime = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : title = Value(title),
        categoryLocalId = Value(categoryLocalId),
        userLocalId = Value(userLocalId);

  static Insertable<TaskTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? categoryLocalId,
    Expression<bool>? isSynced,
    Expression<String>? priority,
    Expression<int>? userLocalId,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
    Expression<DateTime>? completedAt,
    Expression<bool>? hasTime,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (categoryLocalId != null) 'category_local_id': categoryLocalId,
      if (isSynced != null) 'is_synced': isSynced,
      if (priority != null) 'priority': priority,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (completedAt != null) 'completed_at': completedAt,
      if (hasTime != null) 'has_time': hasTime,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? title,
      Value<String>? description,
      Value<int>? categoryLocalId,
      Value<bool>? isSynced,
      Value<String>? priority,
      Value<int>? userLocalId,
      Value<String>? status,
      Value<DateTime?>? dueDate,
      Value<DateTime?>? completedAt,
      Value<bool>? hasTime,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TaskTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      description: description ?? this.description,
      categoryLocalId: categoryLocalId ?? this.categoryLocalId,
      isSynced: isSynced ?? this.isSynced,
      priority: priority ?? this.priority,
      userLocalId: userLocalId ?? this.userLocalId,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      completedAt: completedAt ?? this.completedAt,
      hasTime: hasTime ?? this.hasTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (categoryLocalId.present) {
      map['category_local_id'] = Variable<int>(categoryLocalId.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (hasTime.present) {
      map['has_time'] = Variable<bool>(hasTime.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('categoryLocalId: $categoryLocalId, ')
          ..write('isSynced: $isSynced, ')
          ..write('priority: $priority, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('completedAt: $completedAt, ')
          ..write('hasTime: $hasTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SubtaskTableTable extends SubtaskTable
    with TableInfo<$SubtaskTableTable, SubtaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $SubtaskTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _taskLocalIdMeta =
      const VerificationMeta('taskLocalId');
  @override
  late final GeneratedColumn<int> taskLocalId = GeneratedColumn<int>(
      'task_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES task (local_id) ON DELETE CASCADE'));
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);

  @override
  List<GeneratedColumn> get $columns => [
        localId,
        remoteId,
        title,
        isSynced,
        isCompleted,
        taskLocalId,
        completedAt,
        createdAt,
        updatedAt
      ];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'subtask';

  @override
  VerificationContext validateIntegrity(Insertable<SubtaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('task_local_id')) {
      context.handle(
          _taskLocalIdMeta,
          taskLocalId.isAcceptableOrUnknown(
              data['task_local_id']!, _taskLocalIdMeta));
    } else if (isInserting) {
      context.missing(_taskLocalIdMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};

  @override
  SubtaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubtaskTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      taskLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_local_id'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SubtaskTableTable createAlias(String alias) {
    return $SubtaskTableTable(attachedDatabase, alias);
  }
}

class SubtaskTableData extends DataClass
    implements Insertable<SubtaskTableData> {
  final int localId;
  final String remoteId;
  final String title;
  final bool isSynced;
  final bool isCompleted;
  final int taskLocalId;
  final DateTime? completedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SubtaskTableData(
      {required this.localId,
      required this.remoteId,
      required this.title,
      required this.isSynced,
      required this.isCompleted,
      required this.taskLocalId,
      this.completedAt,
      required this.createdAt,
      required this.updatedAt});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['title'] = Variable<String>(title);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['task_local_id'] = Variable<int>(taskLocalId);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SubtaskTableCompanion toCompanion(bool nullToAbsent) {
    return SubtaskTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      title: Value(title),
      isSynced: Value(isSynced),
      isCompleted: Value(isCompleted),
      taskLocalId: Value(taskLocalId),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SubtaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubtaskTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      title: serializer.fromJson<String>(json['title']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      taskLocalId: serializer.fromJson<int>(json['taskLocalId']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'title': serializer.toJson<String>(title),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'taskLocalId': serializer.toJson<int>(taskLocalId),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SubtaskTableData copyWith(
          {int? localId,
          String? remoteId,
          String? title,
          bool? isSynced,
          bool? isCompleted,
          int? taskLocalId,
          Value<DateTime?> completedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SubtaskTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        title: title ?? this.title,
        isSynced: isSynced ?? this.isSynced,
        isCompleted: isCompleted ?? this.isCompleted,
        taskLocalId: taskLocalId ?? this.taskLocalId,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  SubtaskTableData copyWithCompanion(SubtaskTableCompanion data) {
    return SubtaskTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      title: data.title.present ? data.title.value : this.title,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      taskLocalId:
          data.taskLocalId.present ? data.taskLocalId.value : this.taskLocalId,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubtaskTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('isSynced: $isSynced, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('taskLocalId: $taskLocalId, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, remoteId, title, isSynced,
      isCompleted, taskLocalId, completedAt, createdAt, updatedAt);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubtaskTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.title == this.title &&
          other.isSynced == this.isSynced &&
          other.isCompleted == this.isCompleted &&
          other.taskLocalId == this.taskLocalId &&
          other.completedAt == this.completedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubtaskTableCompanion extends UpdateCompanion<SubtaskTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<String> title;
  final Value<bool> isSynced;
  final Value<bool> isCompleted;
  final Value<int> taskLocalId;
  final Value<DateTime?> completedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;

  const SubtaskTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.title = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.taskLocalId = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });

  SubtaskTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String title,
    this.isSynced = const Value.absent(),
    this.isCompleted = const Value.absent(),
    required int taskLocalId,
    this.completedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : title = Value(title),
        taskLocalId = Value(taskLocalId);

  static Insertable<SubtaskTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<String>? title,
    Expression<bool>? isSynced,
    Expression<bool>? isCompleted,
    Expression<int>? taskLocalId,
    Expression<DateTime>? completedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (title != null) 'title': title,
      if (isSynced != null) 'is_synced': isSynced,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (taskLocalId != null) 'task_local_id': taskLocalId,
      if (completedAt != null) 'completed_at': completedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubtaskTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<String>? title,
      Value<bool>? isSynced,
      Value<bool>? isCompleted,
      Value<int>? taskLocalId,
      Value<DateTime?>? completedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SubtaskTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      isSynced: isSynced ?? this.isSynced,
      isCompleted: isCompleted ?? this.isCompleted,
      taskLocalId: taskLocalId ?? this.taskLocalId,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (taskLocalId.present) {
      map['task_local_id'] = Variable<int>(taskLocalId.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubtaskTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('isSynced: $isSynced, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('taskLocalId: $taskLocalId, ')
          ..write('completedAt: $completedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $SettingTableTable extends SettingTable
    with TableInfo<$SettingTableTable, SettingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $SettingTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _userLocalIdMeta =
      const VerificationMeta('userLocalId');
  @override
  late final GeneratedColumn<int> userLocalId = GeneratedColumn<int>(
      'user_local_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user (local_id) ON DELETE CASCADE'));
  static const VerificationMeta _isNotificationEnabledMeta =
      const VerificationMeta('isNotificationEnabled');
  @override
  late final GeneratedColumn<bool> isNotificationEnabled =
      GeneratedColumn<bool>('is_notification_enabled', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_notification_enabled" IN (0, 1))'));
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remindBeforeMeta =
      const VerificationMeta('remindBefore');
  @override
  late final GeneratedColumn<int> remindBefore = GeneratedColumn<int>(
      'remind_before', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));

  @override
  List<GeneratedColumn> get $columns => [
        localId,
        remoteId,
        userLocalId,
        isNotificationEnabled,
        language,
        theme,
        remindBefore,
        isSynced
      ];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'ai';

  @override
  VerificationContext validateIntegrity(Insertable<SettingTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('user_local_id')) {
      context.handle(
          _userLocalIdMeta,
          userLocalId.isAcceptableOrUnknown(
              data['user_local_id']!, _userLocalIdMeta));
    } else if (isInserting) {
      context.missing(_userLocalIdMeta);
    }
    if (data.containsKey('is_notification_enabled')) {
      context.handle(
          _isNotificationEnabledMeta,
          isNotificationEnabled.isAcceptableOrUnknown(
              data['is_notification_enabled']!, _isNotificationEnabledMeta));
    } else if (isInserting) {
      context.missing(_isNotificationEnabledMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('remind_before')) {
      context.handle(
          _remindBeforeMeta,
          remindBefore.isAcceptableOrUnknown(
              data['remind_before']!, _remindBeforeMeta));
    } else if (isInserting) {
      context.missing(_remindBeforeMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};

  @override
  SettingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingTableData(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      userLocalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_local_id'])!,
      isNotificationEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_notification_enabled'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      remindBefore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remind_before'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $SettingTableTable createAlias(String alias) {
    return $SettingTableTable(attachedDatabase, alias);
  }
}

class SettingTableData extends DataClass
    implements Insertable<SettingTableData> {
  final int localId;
  final String remoteId;
  final int userLocalId;
  final bool isNotificationEnabled;
  final String language;
  final String theme;
  final int remindBefore;
  final bool isSynced;

  const SettingTableData(
      {required this.localId,
      required this.remoteId,
      required this.userLocalId,
      required this.isNotificationEnabled,
      required this.language,
      required this.theme,
      required this.remindBefore,
      required this.isSynced});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['remote_id'] = Variable<String>(remoteId);
    map['user_local_id'] = Variable<int>(userLocalId);
    map['is_notification_enabled'] = Variable<bool>(isNotificationEnabled);
    map['language'] = Variable<String>(language);
    map['theme'] = Variable<String>(theme);
    map['remind_before'] = Variable<int>(remindBefore);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  SettingTableCompanion toCompanion(bool nullToAbsent) {
    return SettingTableCompanion(
      localId: Value(localId),
      remoteId: Value(remoteId),
      userLocalId: Value(userLocalId),
      isNotificationEnabled: Value(isNotificationEnabled),
      language: Value(language),
      theme: Value(theme),
      remindBefore: Value(remindBefore),
      isSynced: Value(isSynced),
    );
  }

  factory SettingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingTableData(
      localId: serializer.fromJson<int>(json['localId']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      userLocalId: serializer.fromJson<int>(json['userLocalId']),
      isNotificationEnabled:
          serializer.fromJson<bool>(json['isNotificationEnabled']),
      language: serializer.fromJson<String>(json['language']),
      theme: serializer.fromJson<String>(json['theme']),
      remindBefore: serializer.fromJson<int>(json['remindBefore']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'remoteId': serializer.toJson<String>(remoteId),
      'userLocalId': serializer.toJson<int>(userLocalId),
      'isNotificationEnabled': serializer.toJson<bool>(isNotificationEnabled),
      'language': serializer.toJson<String>(language),
      'theme': serializer.toJson<String>(theme),
      'remindBefore': serializer.toJson<int>(remindBefore),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  SettingTableData copyWith(
          {int? localId,
          String? remoteId,
          int? userLocalId,
          bool? isNotificationEnabled,
          String? language,
          String? theme,
          int? remindBefore,
          bool? isSynced}) =>
      SettingTableData(
        localId: localId ?? this.localId,
        remoteId: remoteId ?? this.remoteId,
        userLocalId: userLocalId ?? this.userLocalId,
        isNotificationEnabled:
            isNotificationEnabled ?? this.isNotificationEnabled,
        language: language ?? this.language,
        theme: theme ?? this.theme,
        remindBefore: remindBefore ?? this.remindBefore,
        isSynced: isSynced ?? this.isSynced,
      );

  SettingTableData copyWithCompanion(SettingTableCompanion data) {
    return SettingTableData(
      localId: data.localId.present ? data.localId.value : this.localId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      userLocalId:
          data.userLocalId.present ? data.userLocalId.value : this.userLocalId,
      isNotificationEnabled: data.isNotificationEnabled.present
          ? data.isNotificationEnabled.value
          : this.isNotificationEnabled,
      language: data.language.present ? data.language.value : this.language,
      theme: data.theme.present ? data.theme.value : this.theme,
      remindBefore: data.remindBefore.present
          ? data.remindBefore.value
          : this.remindBefore,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingTableData(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('isNotificationEnabled: $isNotificationEnabled, ')
          ..write('language: $language, ')
          ..write('theme: $theme, ')
          ..write('remindBefore: $remindBefore, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, remoteId, userLocalId,
      isNotificationEnabled, language, theme, remindBefore, isSynced);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingTableData &&
          other.localId == this.localId &&
          other.remoteId == this.remoteId &&
          other.userLocalId == this.userLocalId &&
          other.isNotificationEnabled == this.isNotificationEnabled &&
          other.language == this.language &&
          other.theme == this.theme &&
          other.remindBefore == this.remindBefore &&
          other.isSynced == this.isSynced);
}

class SettingTableCompanion extends UpdateCompanion<SettingTableData> {
  final Value<int> localId;
  final Value<String> remoteId;
  final Value<int> userLocalId;
  final Value<bool> isNotificationEnabled;
  final Value<String> language;
  final Value<String> theme;
  final Value<int> remindBefore;
  final Value<bool> isSynced;

  const SettingTableCompanion({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.userLocalId = const Value.absent(),
    this.isNotificationEnabled = const Value.absent(),
    this.language = const Value.absent(),
    this.theme = const Value.absent(),
    this.remindBefore = const Value.absent(),
    this.isSynced = const Value.absent(),
  });

  SettingTableCompanion.insert({
    this.localId = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int userLocalId,
    required bool isNotificationEnabled,
    required String language,
    required String theme,
    required int remindBefore,
    this.isSynced = const Value.absent(),
  })  : userLocalId = Value(userLocalId),
        isNotificationEnabled = Value(isNotificationEnabled),
        language = Value(language),
        theme = Value(theme),
        remindBefore = Value(remindBefore);

  static Insertable<SettingTableData> custom({
    Expression<int>? localId,
    Expression<String>? remoteId,
    Expression<int>? userLocalId,
    Expression<bool>? isNotificationEnabled,
    Expression<String>? language,
    Expression<String>? theme,
    Expression<int>? remindBefore,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (remoteId != null) 'remote_id': remoteId,
      if (userLocalId != null) 'user_local_id': userLocalId,
      if (isNotificationEnabled != null)
        'is_notification_enabled': isNotificationEnabled,
      if (language != null) 'language': language,
      if (theme != null) 'theme': theme,
      if (remindBefore != null) 'remind_before': remindBefore,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  SettingTableCompanion copyWith(
      {Value<int>? localId,
      Value<String>? remoteId,
      Value<int>? userLocalId,
      Value<bool>? isNotificationEnabled,
      Value<String>? language,
      Value<String>? theme,
      Value<int>? remindBefore,
      Value<bool>? isSynced}) {
    return SettingTableCompanion(
      localId: localId ?? this.localId,
      remoteId: remoteId ?? this.remoteId,
      userLocalId: userLocalId ?? this.userLocalId,
      isNotificationEnabled:
          isNotificationEnabled ?? this.isNotificationEnabled,
      language: language ?? this.language,
      theme: theme ?? this.theme,
      remindBefore: remindBefore ?? this.remindBefore,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (userLocalId.present) {
      map['user_local_id'] = Variable<int>(userLocalId.value);
    }
    if (isNotificationEnabled.present) {
      map['is_notification_enabled'] =
          Variable<bool>(isNotificationEnabled.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (remindBefore.present) {
      map['remind_before'] = Variable<int>(remindBefore.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingTableCompanion(')
          ..write('localId: $localId, ')
          ..write('remoteId: $remoteId, ')
          ..write('userLocalId: $userLocalId, ')
          ..write('isNotificationEnabled: $isNotificationEnabled, ')
          ..write('language: $language, ')
          ..write('theme: $theme, ')
          ..write('remindBefore: $remindBefore, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);

  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $SubtaskTableTable subtaskTable = $SubtaskTableTable(this);
  late final $SettingTableTable settingTable = $SettingTableTable(this);
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final SubtaskDao subtaskDao = SubtaskDao(this as AppDatabase);
  late final SettingDao settingDao = SettingDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userTable, categoryTable, taskTable, subtaskTable, settingTable];

  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('user',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('category', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('user',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('task', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('task',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('subtask', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('user',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('ai', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  required String email,
  required String name,
  required String avatar,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> email,
  Value<String> name,
  Value<String> avatar,
});

final class $$UserTableTableReferences
    extends BaseReferences<_$AppDatabase, $UserTableTable, UserTableData> {
  $$UserTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CategoryTableTable, List<CategoryTableData>>
      _categoryTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.categoryTable,
              aliasName: $_aliasNameGenerator(
                  db.userTable.localId, db.categoryTable.userLocalId));

  $$CategoryTableTableProcessedTableManager get categoryTableRefs {
    final manager = $$CategoryTableTableTableManager($_db, $_db.categoryTable)
        .filter((f) =>
            f.userLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!));

    final cache = $_typedResult.readTableOrNull(_categoryTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TaskTableTable, List<TaskTableData>>
      _taskTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.taskTable,
              aliasName: $_aliasNameGenerator(
                  db.userTable.localId, db.taskTable.userLocalId));

  $$TaskTableTableProcessedTableManager get taskTableRefs {
    final manager = $$TaskTableTableTableManager($_db, $_db.taskTable).filter(
        (f) => f.userLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!));

    final cache = $_typedResult.readTableOrNull(_taskTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SettingTableTable, List<SettingTableData>>
      _settingTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.settingTable,
              aliasName: $_aliasNameGenerator(
                  db.userTable.localId, db.settingTable.userLocalId));

  $$SettingTableTableProcessedTableManager get settingTableRefs {
    final manager = $$SettingTableTableTableManager($_db, $_db.settingTable)
        .filter((f) =>
            f.userLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!));

    final cache = $_typedResult.readTableOrNull(_settingTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnFilters(column));

  Expression<bool> categoryTableRefs(
      Expression<bool> Function($$CategoryTableTableFilterComposer f) f) {
    final $$CategoryTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.categoryTable,
        getReferencedColumn: (t) => t.userLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableTableFilterComposer(
              $db: $db,
              $table: $db.categoryTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> taskTableRefs(
      Expression<bool> Function($$TaskTableTableFilterComposer f) f) {
    final $$TaskTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.taskTable,
        getReferencedColumn: (t) => t.userLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTableTableFilterComposer(
              $db: $db,
              $table: $db.taskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> settingTableRefs(
      Expression<bool> Function($$SettingTableTableFilterComposer f) f) {
    final $$SettingTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.settingTable,
        getReferencedColumn: (t) => t.userLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SettingTableTableFilterComposer(
              $db: $db,
              $table: $db.settingTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatar => $composableBuilder(
      column: $table.avatar, builder: (column) => ColumnOrderings(column));
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get avatar =>
      $composableBuilder(column: $table.avatar, builder: (column) => column);

  Expression<T> categoryTableRefs<T extends Object>(
      Expression<T> Function($$CategoryTableTableAnnotationComposer a) f) {
    final $$CategoryTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.categoryTable,
        getReferencedColumn: (t) => t.userLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableTableAnnotationComposer(
              $db: $db,
              $table: $db.categoryTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> taskTableRefs<T extends Object>(
      Expression<T> Function($$TaskTableTableAnnotationComposer a) f) {
    final $$TaskTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.taskTable,
        getReferencedColumn: (t) => t.userLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTableTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> settingTableRefs<T extends Object>(
      Expression<T> Function($$SettingTableTableAnnotationComposer a) f) {
    final $$SettingTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.settingTable,
        getReferencedColumn: (t) => t.userLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SettingTableTableAnnotationComposer(
              $db: $db,
              $table: $db.settingTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UserTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (UserTableData, $$UserTableTableReferences),
    UserTableData,
    PrefetchHooks Function(
        {bool categoryTableRefs, bool taskTableRefs, bool settingTableRefs})> {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> avatar = const Value.absent(),
          }) =>
              UserTableCompanion(
            localId: localId,
            remoteId: remoteId,
            email: email,
            name: name,
            avatar: avatar,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String email,
            required String name,
            required String avatar,
          }) =>
              UserTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            email: email,
            name: name,
            avatar: avatar,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UserTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryTableRefs = false,
              taskTableRefs = false,
              settingTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (categoryTableRefs) db.categoryTable,
                if (taskTableRefs) db.taskTable,
                if (settingTableRefs) db.settingTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (categoryTableRefs)
                    await $_getPrefetchedData<UserTableData, $UserTableTable,
                            CategoryTableData>(
                        currentTable: table,
                        referencedTable: $$UserTableTableReferences
                            ._categoryTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserTableTableReferences(db, table, p0)
                                .categoryTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userLocalId == item.localId),
                        typedResults: items),
                  if (taskTableRefs)
                    await $_getPrefetchedData<UserTableData, $UserTableTable,
                            TaskTableData>(
                        currentTable: table,
                        referencedTable:
                            $$UserTableTableReferences._taskTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserTableTableReferences(db, table, p0)
                                .taskTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userLocalId == item.localId),
                        typedResults: items),
                  if (settingTableRefs)
                    await $_getPrefetchedData<UserTableData, $UserTableTable,
                            SettingTableData>(
                        currentTable: table,
                        referencedTable: $$UserTableTableReferences
                            ._settingTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UserTableTableReferences(db, table, p0)
                                .settingTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.userLocalId == item.localId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UserTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserTableTable,
    UserTableData,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (UserTableData, $$UserTableTableReferences),
    UserTableData,
    PrefetchHooks Function(
        {bool categoryTableRefs, bool taskTableRefs, bool settingTableRefs})>;
typedef $$CategoryTableTableCreateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  required String name,
  Value<bool> isSynced,
  required int userLocalId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$CategoryTableTableUpdateCompanionBuilder = CategoryTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> name,
  Value<bool> isSynced,
  Value<int> userLocalId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$CategoryTableTableReferences extends BaseReferences<_$AppDatabase,
    $CategoryTableTable, CategoryTableData> {
  $$CategoryTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UserTableTable _userLocalIdTable(_$AppDatabase db) =>
      db.userTable.createAlias($_aliasNameGenerator(
          db.categoryTable.userLocalId, db.userTable.localId));

  $$UserTableTableProcessedTableManager get userLocalId {
    final $_column = $_itemColumn<int>('user_local_id')!;

    final manager = $$UserTableTableTableManager($_db, $_db.userTable)
        .filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TaskTableTable, List<TaskTableData>>
      _taskTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.taskTable,
              aliasName: $_aliasNameGenerator(
                  db.categoryTable.localId, db.taskTable.categoryLocalId));

  $$TaskTableTableProcessedTableManager get taskTableRefs {
    final manager = $$TaskTableTableTableManager($_db, $_db.taskTable).filter(
        (f) => f.categoryLocalId.localId
            .sqlEquals($_itemColumn<int>('local_id')!));

    final cache = $_typedResult.readTableOrNull(_taskTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$UserTableTableFilterComposer get userLocalId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableFilterComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> taskTableRefs(
      Expression<bool> Function($$TaskTableTableFilterComposer f) f) {
    final $$TaskTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.taskTable,
        getReferencedColumn: (t) => t.categoryLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTableTableFilterComposer(
              $db: $db,
              $table: $db.taskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$UserTableTableOrderingComposer get userLocalId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableOrderingComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTableTable> {
  $$CategoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userLocalId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableAnnotationComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> taskTableRefs<T extends Object>(
      Expression<T> Function($$TaskTableTableAnnotationComposer a) f) {
    final $$TaskTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.taskTable,
        getReferencedColumn: (t) => t.categoryLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTableTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (CategoryTableData, $$CategoryTableTableReferences),
    CategoryTableData,
    PrefetchHooks Function({bool userLocalId, bool taskTableRefs})> {
  $$CategoryTableTableTableManager(_$AppDatabase db, $CategoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<int> userLocalId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoryTableCompanion(
            localId: localId,
            remoteId: remoteId,
            name: name,
            isSynced: isSynced,
            userLocalId: userLocalId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String name,
            Value<bool> isSynced = const Value.absent(),
            required int userLocalId,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CategoryTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            name: name,
            isSynced: isSynced,
            userLocalId: userLocalId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoryTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {userLocalId = false, taskTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (taskTableRefs) db.taskTable],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userLocalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userLocalId,
                    referencedTable:
                        $$CategoryTableTableReferences._userLocalIdTable(db),
                    referencedColumn: $$CategoryTableTableReferences
                        ._userLocalIdTable(db)
                        .localId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskTableRefs)
                    await $_getPrefetchedData<CategoryTableData,
                            $CategoryTableTable, TaskTableData>(
                        currentTable: table,
                        referencedTable: $$CategoryTableTableReferences
                            ._taskTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoryTableTableReferences(db, table, p0)
                                .taskTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryLocalId == item.localId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryTableTable,
    CategoryTableData,
    $$CategoryTableTableFilterComposer,
    $$CategoryTableTableOrderingComposer,
    $$CategoryTableTableAnnotationComposer,
    $$CategoryTableTableCreateCompanionBuilder,
    $$CategoryTableTableUpdateCompanionBuilder,
    (CategoryTableData, $$CategoryTableTableReferences),
    CategoryTableData,
    PrefetchHooks Function({bool userLocalId, bool taskTableRefs})>;
typedef $$TaskTableTableCreateCompanionBuilder = TaskTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  required String title,
  Value<String> description,
  required int categoryLocalId,
  Value<bool> isSynced,
  Value<String> priority,
  required int userLocalId,
  Value<String> status,
  Value<DateTime?> dueDate,
  Value<DateTime?> completedAt,
  Value<bool> hasTime,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> title,
  Value<String> description,
  Value<int> categoryLocalId,
  Value<bool> isSynced,
  Value<String> priority,
  Value<int> userLocalId,
  Value<String> status,
  Value<DateTime?> dueDate,
  Value<DateTime?> completedAt,
  Value<bool> hasTime,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$TaskTableTableReferences
    extends BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData> {
  $$TaskTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CategoryTableTable _categoryLocalIdTable(_$AppDatabase db) =>
      db.categoryTable.createAlias($_aliasNameGenerator(
          db.taskTable.categoryLocalId, db.categoryTable.localId));

  $$CategoryTableTableProcessedTableManager get categoryLocalId {
    final $_column = $_itemColumn<int>('category_local_id')!;

    final manager = $$CategoryTableTableTableManager($_db, $_db.categoryTable)
        .filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UserTableTable _userLocalIdTable(_$AppDatabase db) =>
      db.userTable.createAlias(
          $_aliasNameGenerator(db.taskTable.userLocalId, db.userTable.localId));

  $$UserTableTableProcessedTableManager get userLocalId {
    final $_column = $_itemColumn<int>('user_local_id')!;

    final manager = $$UserTableTableTableManager($_db, $_db.userTable)
        .filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$SubtaskTableTable, List<SubtaskTableData>>
      _subtaskTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.subtaskTable,
              aliasName: $_aliasNameGenerator(
                  db.taskTable.localId, db.subtaskTable.taskLocalId));

  $$SubtaskTableTableProcessedTableManager get subtaskTableRefs {
    final manager = $$SubtaskTableTableTableManager($_db, $_db.subtaskTable)
        .filter((f) =>
            f.taskLocalId.localId.sqlEquals($_itemColumn<int>('local_id')!));

    final cache = $_typedResult.readTableOrNull(_subtaskTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TaskTableTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasTime => $composableBuilder(
      column: $table.hasTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$CategoryTableTableFilterComposer get categoryLocalId {
    final $$CategoryTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryLocalId,
        referencedTable: $db.categoryTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableTableFilterComposer(
              $db: $db,
              $table: $db.categoryTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UserTableTableFilterComposer get userLocalId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableFilterComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> subtaskTableRefs(
      Expression<bool> Function($$SubtaskTableTableFilterComposer f) f) {
    final $$SubtaskTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.subtaskTable,
        getReferencedColumn: (t) => t.taskLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubtaskTableTableFilterComposer(
              $db: $db,
              $table: $db.subtaskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TaskTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasTime => $composableBuilder(
      column: $table.hasTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$CategoryTableTableOrderingComposer get categoryLocalId {
    final $$CategoryTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryLocalId,
        referencedTable: $db.categoryTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableTableOrderingComposer(
              $db: $db,
              $table: $db.categoryTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UserTableTableOrderingComposer get userLocalId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableOrderingComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TaskTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<bool> get hasTime =>
      $composableBuilder(column: $table.hasTime, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CategoryTableTableAnnotationComposer get categoryLocalId {
    final $$CategoryTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryLocalId,
        referencedTable: $db.categoryTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoryTableTableAnnotationComposer(
              $db: $db,
              $table: $db.categoryTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UserTableTableAnnotationComposer get userLocalId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableAnnotationComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> subtaskTableRefs<T extends Object>(
      Expression<T> Function($$SubtaskTableTableAnnotationComposer a) f) {
    final $$SubtaskTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.localId,
        referencedTable: $db.subtaskTable,
        getReferencedColumn: (t) => t.taskLocalId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SubtaskTableTableAnnotationComposer(
              $db: $db,
              $table: $db.subtaskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableAnnotationComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (TaskTableData, $$TaskTableTableReferences),
    TaskTableData,
    PrefetchHooks Function(
        {bool categoryLocalId, bool userLocalId, bool subtaskTableRefs})> {
  $$TaskTableTableTableManager(_$AppDatabase db, $TaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> categoryLocalId = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<int> userLocalId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<bool> hasTime = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TaskTableCompanion(
            localId: localId,
            remoteId: remoteId,
            title: title,
            description: description,
            categoryLocalId: categoryLocalId,
            isSynced: isSynced,
            priority: priority,
            userLocalId: userLocalId,
            status: status,
            dueDate: dueDate,
            completedAt: completedAt,
            hasTime: hasTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String title,
            Value<String> description = const Value.absent(),
            required int categoryLocalId,
            Value<bool> isSynced = const Value.absent(),
            Value<String> priority = const Value.absent(),
            required int userLocalId,
            Value<String> status = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<bool> hasTime = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TaskTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            title: title,
            description: description,
            categoryLocalId: categoryLocalId,
            isSynced: isSynced,
            priority: priority,
            userLocalId: userLocalId,
            status: status,
            dueDate: dueDate,
            completedAt: completedAt,
            hasTime: hasTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TaskTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryLocalId = false,
              userLocalId = false,
              subtaskTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (subtaskTableRefs) db.subtaskTable],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryLocalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryLocalId,
                    referencedTable:
                        $$TaskTableTableReferences._categoryLocalIdTable(db),
                    referencedColumn: $$TaskTableTableReferences
                        ._categoryLocalIdTable(db)
                        .localId,
                  ) as T;
                }
                if (userLocalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userLocalId,
                    referencedTable:
                        $$TaskTableTableReferences._userLocalIdTable(db),
                    referencedColumn: $$TaskTableTableReferences
                        ._userLocalIdTable(db)
                        .localId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (subtaskTableRefs)
                    await $_getPrefetchedData<TaskTableData, $TaskTableTable,
                            SubtaskTableData>(
                        currentTable: table,
                        referencedTable: $$TaskTableTableReferences
                            ._subtaskTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TaskTableTableReferences(db, table, p0)
                                .subtaskTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.taskLocalId == item.localId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TaskTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableAnnotationComposer,
    $$TaskTableTableCreateCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder,
    (TaskTableData, $$TaskTableTableReferences),
    TaskTableData,
    PrefetchHooks Function(
        {bool categoryLocalId, bool userLocalId, bool subtaskTableRefs})>;
typedef $$SubtaskTableTableCreateCompanionBuilder = SubtaskTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  required String title,
  Value<bool> isSynced,
  Value<bool> isCompleted,
  required int taskLocalId,
  Value<DateTime?> completedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$SubtaskTableTableUpdateCompanionBuilder = SubtaskTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<String> title,
  Value<bool> isSynced,
  Value<bool> isCompleted,
  Value<int> taskLocalId,
  Value<DateTime?> completedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$SubtaskTableTableReferences extends BaseReferences<_$AppDatabase,
    $SubtaskTableTable, SubtaskTableData> {
  $$SubtaskTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TaskTableTable _taskLocalIdTable(_$AppDatabase db) =>
      db.taskTable.createAlias($_aliasNameGenerator(
          db.subtaskTable.taskLocalId, db.taskTable.localId));

  $$TaskTableTableProcessedTableManager get taskLocalId {
    final $_column = $_itemColumn<int>('task_local_id')!;

    final manager = $$TaskTableTableTableManager($_db, $_db.taskTable)
        .filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SubtaskTableTableFilterComposer
    extends Composer<_$AppDatabase, $SubtaskTableTable> {
  $$SubtaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$TaskTableTableFilterComposer get taskLocalId {
    final $$TaskTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskLocalId,
        referencedTable: $db.taskTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTableTableFilterComposer(
              $db: $db,
              $table: $db.taskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SubtaskTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SubtaskTableTable> {
  $$SubtaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$TaskTableTableOrderingComposer get taskLocalId {
    final $$TaskTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskLocalId,
        referencedTable: $db.taskTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTableTableOrderingComposer(
              $db: $db,
              $table: $db.taskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SubtaskTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubtaskTableTable> {
  $$SubtaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TaskTableTableAnnotationComposer get taskLocalId {
    final $$TaskTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.taskLocalId,
        referencedTable: $db.taskTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TaskTableTableAnnotationComposer(
              $db: $db,
              $table: $db.taskTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SubtaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubtaskTableTable,
    SubtaskTableData,
    $$SubtaskTableTableFilterComposer,
    $$SubtaskTableTableOrderingComposer,
    $$SubtaskTableTableAnnotationComposer,
    $$SubtaskTableTableCreateCompanionBuilder,
    $$SubtaskTableTableUpdateCompanionBuilder,
    (SubtaskTableData, $$SubtaskTableTableReferences),
    SubtaskTableData,
    PrefetchHooks Function({bool taskLocalId})> {
  $$SubtaskTableTableTableManager(_$AppDatabase db, $SubtaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubtaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubtaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubtaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<int> taskLocalId = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SubtaskTableCompanion(
            localId: localId,
            remoteId: remoteId,
            title: title,
            isSynced: isSynced,
            isCompleted: isCompleted,
            taskLocalId: taskLocalId,
            completedAt: completedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required String title,
            Value<bool> isSynced = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            required int taskLocalId,
            Value<DateTime?> completedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SubtaskTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            title: title,
            isSynced: isSynced,
            isCompleted: isCompleted,
            taskLocalId: taskLocalId,
            completedAt: completedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SubtaskTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({taskLocalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (taskLocalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.taskLocalId,
                    referencedTable:
                        $$SubtaskTableTableReferences._taskLocalIdTable(db),
                    referencedColumn: $$SubtaskTableTableReferences
                        ._taskLocalIdTable(db)
                        .localId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SubtaskTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubtaskTableTable,
    SubtaskTableData,
    $$SubtaskTableTableFilterComposer,
    $$SubtaskTableTableOrderingComposer,
    $$SubtaskTableTableAnnotationComposer,
    $$SubtaskTableTableCreateCompanionBuilder,
    $$SubtaskTableTableUpdateCompanionBuilder,
    (SubtaskTableData, $$SubtaskTableTableReferences),
    SubtaskTableData,
    PrefetchHooks Function({bool taskLocalId})>;
typedef $$SettingTableTableCreateCompanionBuilder = SettingTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  required int userLocalId,
  required bool isNotificationEnabled,
  required String language,
  required String theme,
  required int remindBefore,
  Value<bool> isSynced,
});
typedef $$SettingTableTableUpdateCompanionBuilder = SettingTableCompanion
    Function({
  Value<int> localId,
  Value<String> remoteId,
  Value<int> userLocalId,
  Value<bool> isNotificationEnabled,
  Value<String> language,
  Value<String> theme,
  Value<int> remindBefore,
  Value<bool> isSynced,
});

final class $$SettingTableTableReferences extends BaseReferences<_$AppDatabase,
    $SettingTableTable, SettingTableData> {
  $$SettingTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTableTable _userLocalIdTable(_$AppDatabase db) =>
      db.userTable.createAlias($_aliasNameGenerator(
          db.settingTable.userLocalId, db.userTable.localId));

  $$UserTableTableProcessedTableManager get userLocalId {
    final $_column = $_itemColumn<int>('user_local_id')!;

    final manager = $$UserTableTableTableManager($_db, $_db.userTable)
        .filter((f) => f.localId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userLocalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SettingTableTableFilterComposer
    extends Composer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isNotificationEnabled => $composableBuilder(
      column: $table.isNotificationEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get theme => $composableBuilder(
      column: $table.theme, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remindBefore => $composableBuilder(
      column: $table.remindBefore, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));

  $$UserTableTableFilterComposer get userLocalId {
    final $$UserTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableFilterComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SettingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isNotificationEnabled => $composableBuilder(
      column: $table.isNotificationEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get theme => $composableBuilder(
      column: $table.theme, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remindBefore => $composableBuilder(
      column: $table.remindBefore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));

  $$UserTableTableOrderingComposer get userLocalId {
    final $$UserTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableOrderingComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SettingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingTableTable> {
  $$SettingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<bool> get isNotificationEnabled => $composableBuilder(
      column: $table.isNotificationEnabled, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);

  GeneratedColumn<int> get remindBefore => $composableBuilder(
      column: $table.remindBefore, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$UserTableTableAnnotationComposer get userLocalId {
    final $$UserTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userLocalId,
        referencedTable: $db.userTable,
        getReferencedColumn: (t) => t.localId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UserTableTableAnnotationComposer(
              $db: $db,
              $table: $db.userTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SettingTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingTableTable,
    SettingTableData,
    $$SettingTableTableFilterComposer,
    $$SettingTableTableOrderingComposer,
    $$SettingTableTableAnnotationComposer,
    $$SettingTableTableCreateCompanionBuilder,
    $$SettingTableTableUpdateCompanionBuilder,
    (SettingTableData, $$SettingTableTableReferences),
    SettingTableData,
    PrefetchHooks Function({bool userLocalId})> {
  $$SettingTableTableTableManager(_$AppDatabase db, $SettingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<int> userLocalId = const Value.absent(),
            Value<bool> isNotificationEnabled = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<String> theme = const Value.absent(),
            Value<int> remindBefore = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              SettingTableCompanion(
            localId: localId,
            remoteId: remoteId,
            userLocalId: userLocalId,
            isNotificationEnabled: isNotificationEnabled,
            language: language,
            theme: theme,
            remindBefore: remindBefore,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> localId = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            required int userLocalId,
            required bool isNotificationEnabled,
            required String language,
            required String theme,
            required int remindBefore,
            Value<bool> isSynced = const Value.absent(),
          }) =>
              SettingTableCompanion.insert(
            localId: localId,
            remoteId: remoteId,
            userLocalId: userLocalId,
            isNotificationEnabled: isNotificationEnabled,
            language: language,
            theme: theme,
            remindBefore: remindBefore,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SettingTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({userLocalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (userLocalId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.userLocalId,
                    referencedTable:
                        $$SettingTableTableReferences._userLocalIdTable(db),
                    referencedColumn: $$SettingTableTableReferences
                        ._userLocalIdTable(db)
                        .localId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SettingTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingTableTable,
    SettingTableData,
    $$SettingTableTableFilterComposer,
    $$SettingTableTableOrderingComposer,
    $$SettingTableTableAnnotationComposer,
    $$SettingTableTableCreateCompanionBuilder,
    $$SettingTableTableUpdateCompanionBuilder,
    (SettingTableData, $$SettingTableTableReferences),
    SettingTableData,
    PrefetchHooks Function({bool userLocalId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;

  $AppDatabaseManager(this._db);

  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);

  $$CategoryTableTableTableManager get categoryTable =>
      $$CategoryTableTableTableManager(_db, _db.categoryTable);

  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);

  $$SubtaskTableTableTableManager get subtaskTable =>
      $$SubtaskTableTableTableManager(_db, _db.subtaskTable);

  $$SettingTableTableTableManager get settingTable =>
      $$SettingTableTableTableManager(_db, _db.settingTable);
}
