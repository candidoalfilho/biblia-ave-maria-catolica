// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bible_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bible _$BibleFromJson(Map<String, dynamic> json) {
  return _Bible.fromJson(json);
}

/// @nodoc
mixin _$Bible {
  List<Testament> get antigoTestamento => throw _privateConstructorUsedError;
  List<Testament> get novoTestamento => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BibleCopyWith<Bible> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleCopyWith<$Res> {
  factory $BibleCopyWith(Bible value, $Res Function(Bible) then) =
      _$BibleCopyWithImpl<$Res, Bible>;
  @useResult
  $Res call({List<Testament> antigoTestamento, List<Testament> novoTestamento});
}

/// @nodoc
class _$BibleCopyWithImpl<$Res, $Val extends Bible>
    implements $BibleCopyWith<$Res> {
  _$BibleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? antigoTestamento = null,
    Object? novoTestamento = null,
  }) {
    return _then(_value.copyWith(
      antigoTestamento: null == antigoTestamento
          ? _value.antigoTestamento
          : antigoTestamento // ignore: cast_nullable_to_non_nullable
              as List<Testament>,
      novoTestamento: null == novoTestamento
          ? _value.novoTestamento
          : novoTestamento // ignore: cast_nullable_to_non_nullable
              as List<Testament>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BibleImplCopyWith<$Res> implements $BibleCopyWith<$Res> {
  factory _$$BibleImplCopyWith(
          _$BibleImpl value, $Res Function(_$BibleImpl) then) =
      __$$BibleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Testament> antigoTestamento, List<Testament> novoTestamento});
}

/// @nodoc
class __$$BibleImplCopyWithImpl<$Res>
    extends _$BibleCopyWithImpl<$Res, _$BibleImpl>
    implements _$$BibleImplCopyWith<$Res> {
  __$$BibleImplCopyWithImpl(
      _$BibleImpl _value, $Res Function(_$BibleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? antigoTestamento = null,
    Object? novoTestamento = null,
  }) {
    return _then(_$BibleImpl(
      antigoTestamento: null == antigoTestamento
          ? _value._antigoTestamento
          : antigoTestamento // ignore: cast_nullable_to_non_nullable
              as List<Testament>,
      novoTestamento: null == novoTestamento
          ? _value._novoTestamento
          : novoTestamento // ignore: cast_nullable_to_non_nullable
              as List<Testament>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BibleImpl implements _Bible {
  const _$BibleImpl(
      {required final List<Testament> antigoTestamento,
      required final List<Testament> novoTestamento})
      : _antigoTestamento = antigoTestamento,
        _novoTestamento = novoTestamento;

  factory _$BibleImpl.fromJson(Map<String, dynamic> json) =>
      _$$BibleImplFromJson(json);

  final List<Testament> _antigoTestamento;
  @override
  List<Testament> get antigoTestamento {
    if (_antigoTestamento is EqualUnmodifiableListView)
      return _antigoTestamento;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_antigoTestamento);
  }

  final List<Testament> _novoTestamento;
  @override
  List<Testament> get novoTestamento {
    if (_novoTestamento is EqualUnmodifiableListView) return _novoTestamento;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_novoTestamento);
  }

  @override
  String toString() {
    return 'Bible(antigoTestamento: $antigoTestamento, novoTestamento: $novoTestamento)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleImpl &&
            const DeepCollectionEquality()
                .equals(other._antigoTestamento, _antigoTestamento) &&
            const DeepCollectionEquality()
                .equals(other._novoTestamento, _novoTestamento));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_antigoTestamento),
      const DeepCollectionEquality().hash(_novoTestamento));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleImplCopyWith<_$BibleImpl> get copyWith =>
      __$$BibleImplCopyWithImpl<_$BibleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BibleImplToJson(
      this,
    );
  }
}

abstract class _Bible implements Bible {
  const factory _Bible(
      {required final List<Testament> antigoTestamento,
      required final List<Testament> novoTestamento}) = _$BibleImpl;

  factory _Bible.fromJson(Map<String, dynamic> json) = _$BibleImpl.fromJson;

  @override
  List<Testament> get antigoTestamento;
  @override
  List<Testament> get novoTestamento;
  @override
  @JsonKey(ignore: true)
  _$$BibleImplCopyWith<_$BibleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Testament _$TestamentFromJson(Map<String, dynamic> json) {
  return _Testament.fromJson(json);
}

/// @nodoc
mixin _$Testament {
  String get nome => throw _privateConstructorUsedError;
  List<Chapter> get capitulos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestamentCopyWith<Testament> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestamentCopyWith<$Res> {
  factory $TestamentCopyWith(Testament value, $Res Function(Testament) then) =
      _$TestamentCopyWithImpl<$Res, Testament>;
  @useResult
  $Res call({String nome, List<Chapter> capitulos});
}

/// @nodoc
class _$TestamentCopyWithImpl<$Res, $Val extends Testament>
    implements $TestamentCopyWith<$Res> {
  _$TestamentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? capitulos = null,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      capitulos: null == capitulos
          ? _value.capitulos
          : capitulos // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestamentImplCopyWith<$Res>
    implements $TestamentCopyWith<$Res> {
  factory _$$TestamentImplCopyWith(
          _$TestamentImpl value, $Res Function(_$TestamentImpl) then) =
      __$$TestamentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nome, List<Chapter> capitulos});
}

/// @nodoc
class __$$TestamentImplCopyWithImpl<$Res>
    extends _$TestamentCopyWithImpl<$Res, _$TestamentImpl>
    implements _$$TestamentImplCopyWith<$Res> {
  __$$TestamentImplCopyWithImpl(
      _$TestamentImpl _value, $Res Function(_$TestamentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? capitulos = null,
  }) {
    return _then(_$TestamentImpl(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      capitulos: null == capitulos
          ? _value._capitulos
          : capitulos // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestamentImpl implements _Testament {
  const _$TestamentImpl(
      {required this.nome, required final List<Chapter> capitulos})
      : _capitulos = capitulos;

  factory _$TestamentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestamentImplFromJson(json);

  @override
  final String nome;
  final List<Chapter> _capitulos;
  @override
  List<Chapter> get capitulos {
    if (_capitulos is EqualUnmodifiableListView) return _capitulos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capitulos);
  }

  @override
  String toString() {
    return 'Testament(nome: $nome, capitulos: $capitulos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestamentImpl &&
            (identical(other.nome, nome) || other.nome == nome) &&
            const DeepCollectionEquality()
                .equals(other._capitulos, _capitulos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, nome, const DeepCollectionEquality().hash(_capitulos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestamentImplCopyWith<_$TestamentImpl> get copyWith =>
      __$$TestamentImplCopyWithImpl<_$TestamentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestamentImplToJson(
      this,
    );
  }
}

abstract class _Testament implements Testament {
  const factory _Testament(
      {required final String nome,
      required final List<Chapter> capitulos}) = _$TestamentImpl;

  factory _Testament.fromJson(Map<String, dynamic> json) =
      _$TestamentImpl.fromJson;

  @override
  String get nome;
  @override
  List<Chapter> get capitulos;
  @override
  @JsonKey(ignore: true)
  _$$TestamentImplCopyWith<_$TestamentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
mixin _$Chapter {
  int get capitulo => throw _privateConstructorUsedError;
  List<Verse> get versiculos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
  @useResult
  $Res call({int capitulo, List<Verse> versiculos});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capitulo = null,
    Object? versiculos = null,
  }) {
    return _then(_value.copyWith(
      capitulo: null == capitulo
          ? _value.capitulo
          : capitulo // ignore: cast_nullable_to_non_nullable
              as int,
      versiculos: null == versiculos
          ? _value.versiculos
          : versiculos // ignore: cast_nullable_to_non_nullable
              as List<Verse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterImplCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$ChapterImplCopyWith(
          _$ChapterImpl value, $Res Function(_$ChapterImpl) then) =
      __$$ChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int capitulo, List<Verse> versiculos});
}

/// @nodoc
class __$$ChapterImplCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$ChapterImpl>
    implements _$$ChapterImplCopyWith<$Res> {
  __$$ChapterImplCopyWithImpl(
      _$ChapterImpl _value, $Res Function(_$ChapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? capitulo = null,
    Object? versiculos = null,
  }) {
    return _then(_$ChapterImpl(
      capitulo: null == capitulo
          ? _value.capitulo
          : capitulo // ignore: cast_nullable_to_non_nullable
              as int,
      versiculos: null == versiculos
          ? _value._versiculos
          : versiculos // ignore: cast_nullable_to_non_nullable
              as List<Verse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterImpl implements _Chapter {
  const _$ChapterImpl(
      {required this.capitulo, required final List<Verse> versiculos})
      : _versiculos = versiculos;

  factory _$ChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterImplFromJson(json);

  @override
  final int capitulo;
  final List<Verse> _versiculos;
  @override
  List<Verse> get versiculos {
    if (_versiculos is EqualUnmodifiableListView) return _versiculos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versiculos);
  }

  @override
  String toString() {
    return 'Chapter(capitulo: $capitulo, versiculos: $versiculos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImpl &&
            (identical(other.capitulo, capitulo) ||
                other.capitulo == capitulo) &&
            const DeepCollectionEquality()
                .equals(other._versiculos, _versiculos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, capitulo, const DeepCollectionEquality().hash(_versiculos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      __$$ChapterImplCopyWithImpl<_$ChapterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterImplToJson(
      this,
    );
  }
}

abstract class _Chapter implements Chapter {
  const factory _Chapter(
      {required final int capitulo,
      required final List<Verse> versiculos}) = _$ChapterImpl;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$ChapterImpl.fromJson;

  @override
  int get capitulo;
  @override
  List<Verse> get versiculos;
  @override
  @JsonKey(ignore: true)
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Verse _$VerseFromJson(Map<String, dynamic> json) {
  return _Verse.fromJson(json);
}

/// @nodoc
mixin _$Verse {
  int get versiculo => throw _privateConstructorUsedError;
  String get texto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerseCopyWith<Verse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerseCopyWith<$Res> {
  factory $VerseCopyWith(Verse value, $Res Function(Verse) then) =
      _$VerseCopyWithImpl<$Res, Verse>;
  @useResult
  $Res call({int versiculo, String texto});
}

/// @nodoc
class _$VerseCopyWithImpl<$Res, $Val extends Verse>
    implements $VerseCopyWith<$Res> {
  _$VerseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versiculo = null,
    Object? texto = null,
  }) {
    return _then(_value.copyWith(
      versiculo: null == versiculo
          ? _value.versiculo
          : versiculo // ignore: cast_nullable_to_non_nullable
              as int,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerseImplCopyWith<$Res> implements $VerseCopyWith<$Res> {
  factory _$$VerseImplCopyWith(
          _$VerseImpl value, $Res Function(_$VerseImpl) then) =
      __$$VerseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int versiculo, String texto});
}

/// @nodoc
class __$$VerseImplCopyWithImpl<$Res>
    extends _$VerseCopyWithImpl<$Res, _$VerseImpl>
    implements _$$VerseImplCopyWith<$Res> {
  __$$VerseImplCopyWithImpl(
      _$VerseImpl _value, $Res Function(_$VerseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versiculo = null,
    Object? texto = null,
  }) {
    return _then(_$VerseImpl(
      versiculo: null == versiculo
          ? _value.versiculo
          : versiculo // ignore: cast_nullable_to_non_nullable
              as int,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerseImpl implements _Verse {
  const _$VerseImpl({required this.versiculo, required this.texto});

  factory _$VerseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerseImplFromJson(json);

  @override
  final int versiculo;
  @override
  final String texto;

  @override
  String toString() {
    return 'Verse(versiculo: $versiculo, texto: $texto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerseImpl &&
            (identical(other.versiculo, versiculo) ||
                other.versiculo == versiculo) &&
            (identical(other.texto, texto) || other.texto == texto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, versiculo, texto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerseImplCopyWith<_$VerseImpl> get copyWith =>
      __$$VerseImplCopyWithImpl<_$VerseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerseImplToJson(
      this,
    );
  }
}

abstract class _Verse implements Verse {
  const factory _Verse(
      {required final int versiculo,
      required final String texto}) = _$VerseImpl;

  factory _Verse.fromJson(Map<String, dynamic> json) = _$VerseImpl.fromJson;

  @override
  int get versiculo;
  @override
  String get texto;
  @override
  @JsonKey(ignore: true)
  _$$VerseImplCopyWith<_$VerseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BibleReference _$BibleReferenceFromJson(Map<String, dynamic> json) {
  return _BibleReference.fromJson(json);
}

/// @nodoc
mixin _$BibleReference {
  String get bookName => throw _privateConstructorUsedError;
  int get chapter => throw _privateConstructorUsedError;
  int get verse => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BibleReferenceCopyWith<BibleReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleReferenceCopyWith<$Res> {
  factory $BibleReferenceCopyWith(
          BibleReference value, $Res Function(BibleReference) then) =
      _$BibleReferenceCopyWithImpl<$Res, BibleReference>;
  @useResult
  $Res call({String bookName, int chapter, int verse, String? text});
}

/// @nodoc
class _$BibleReferenceCopyWithImpl<$Res, $Val extends BibleReference>
    implements $BibleReferenceCopyWith<$Res> {
  _$BibleReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? chapter = null,
    Object? verse = null,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BibleReferenceImplCopyWith<$Res>
    implements $BibleReferenceCopyWith<$Res> {
  factory _$$BibleReferenceImplCopyWith(_$BibleReferenceImpl value,
          $Res Function(_$BibleReferenceImpl) then) =
      __$$BibleReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bookName, int chapter, int verse, String? text});
}

/// @nodoc
class __$$BibleReferenceImplCopyWithImpl<$Res>
    extends _$BibleReferenceCopyWithImpl<$Res, _$BibleReferenceImpl>
    implements _$$BibleReferenceImplCopyWith<$Res> {
  __$$BibleReferenceImplCopyWithImpl(
      _$BibleReferenceImpl _value, $Res Function(_$BibleReferenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookName = null,
    Object? chapter = null,
    Object? verse = null,
    Object? text = freezed,
  }) {
    return _then(_$BibleReferenceImpl(
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as int,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BibleReferenceImpl implements _BibleReference {
  const _$BibleReferenceImpl(
      {required this.bookName,
      required this.chapter,
      required this.verse,
      this.text});

  factory _$BibleReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BibleReferenceImplFromJson(json);

  @override
  final String bookName;
  @override
  final int chapter;
  @override
  final int verse;
  @override
  final String? text;

  @override
  String toString() {
    return 'BibleReference(bookName: $bookName, chapter: $chapter, verse: $verse, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleReferenceImpl &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.verse, verse) || other.verse == verse) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookName, chapter, verse, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleReferenceImplCopyWith<_$BibleReferenceImpl> get copyWith =>
      __$$BibleReferenceImplCopyWithImpl<_$BibleReferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BibleReferenceImplToJson(
      this,
    );
  }
}

abstract class _BibleReference implements BibleReference {
  const factory _BibleReference(
      {required final String bookName,
      required final int chapter,
      required final int verse,
      final String? text}) = _$BibleReferenceImpl;

  factory _BibleReference.fromJson(Map<String, dynamic> json) =
      _$BibleReferenceImpl.fromJson;

  @override
  String get bookName;
  @override
  int get chapter;
  @override
  int get verse;
  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$BibleReferenceImplCopyWith<_$BibleReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteVerse _$FavoriteVerseFromJson(Map<String, dynamic> json) {
  return _FavoriteVerse.fromJson(json);
}

/// @nodoc
mixin _$FavoriteVerse {
  String get id => throw _privateConstructorUsedError;
  String get bookName => throw _privateConstructorUsedError;
  int get chapter => throw _privateConstructorUsedError;
  int get verse => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  HighlightColor? get highlightColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteVerseCopyWith<FavoriteVerse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteVerseCopyWith<$Res> {
  factory $FavoriteVerseCopyWith(
          FavoriteVerse value, $Res Function(FavoriteVerse) then) =
      _$FavoriteVerseCopyWithImpl<$Res, FavoriteVerse>;
  @useResult
  $Res call(
      {String id,
      String bookName,
      int chapter,
      int verse,
      String text,
      DateTime createdAt,
      String? note,
      HighlightColor? highlightColor});
}

/// @nodoc
class _$FavoriteVerseCopyWithImpl<$Res, $Val extends FavoriteVerse>
    implements $FavoriteVerseCopyWith<$Res> {
  _$FavoriteVerseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookName = null,
    Object? chapter = null,
    Object? verse = null,
    Object? text = null,
    Object? createdAt = null,
    Object? note = freezed,
    Object? highlightColor = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      highlightColor: freezed == highlightColor
          ? _value.highlightColor
          : highlightColor // ignore: cast_nullable_to_non_nullable
              as HighlightColor?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteVerseImplCopyWith<$Res>
    implements $FavoriteVerseCopyWith<$Res> {
  factory _$$FavoriteVerseImplCopyWith(
          _$FavoriteVerseImpl value, $Res Function(_$FavoriteVerseImpl) then) =
      __$$FavoriteVerseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bookName,
      int chapter,
      int verse,
      String text,
      DateTime createdAt,
      String? note,
      HighlightColor? highlightColor});
}

/// @nodoc
class __$$FavoriteVerseImplCopyWithImpl<$Res>
    extends _$FavoriteVerseCopyWithImpl<$Res, _$FavoriteVerseImpl>
    implements _$$FavoriteVerseImplCopyWith<$Res> {
  __$$FavoriteVerseImplCopyWithImpl(
      _$FavoriteVerseImpl _value, $Res Function(_$FavoriteVerseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookName = null,
    Object? chapter = null,
    Object? verse = null,
    Object? text = null,
    Object? createdAt = null,
    Object? note = freezed,
    Object? highlightColor = freezed,
  }) {
    return _then(_$FavoriteVerseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      highlightColor: freezed == highlightColor
          ? _value.highlightColor
          : highlightColor // ignore: cast_nullable_to_non_nullable
              as HighlightColor?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteVerseImpl implements _FavoriteVerse {
  const _$FavoriteVerseImpl(
      {required this.id,
      required this.bookName,
      required this.chapter,
      required this.verse,
      required this.text,
      required this.createdAt,
      this.note,
      this.highlightColor});

  factory _$FavoriteVerseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteVerseImplFromJson(json);

  @override
  final String id;
  @override
  final String bookName;
  @override
  final int chapter;
  @override
  final int verse;
  @override
  final String text;
  @override
  final DateTime createdAt;
  @override
  final String? note;
  @override
  final HighlightColor? highlightColor;

  @override
  String toString() {
    return 'FavoriteVerse(id: $id, bookName: $bookName, chapter: $chapter, verse: $verse, text: $text, createdAt: $createdAt, note: $note, highlightColor: $highlightColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteVerseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.verse, verse) || other.verse == verse) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.highlightColor, highlightColor) ||
                other.highlightColor == highlightColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, bookName, chapter, verse,
      text, createdAt, note, highlightColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteVerseImplCopyWith<_$FavoriteVerseImpl> get copyWith =>
      __$$FavoriteVerseImplCopyWithImpl<_$FavoriteVerseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteVerseImplToJson(
      this,
    );
  }
}

abstract class _FavoriteVerse implements FavoriteVerse {
  const factory _FavoriteVerse(
      {required final String id,
      required final String bookName,
      required final int chapter,
      required final int verse,
      required final String text,
      required final DateTime createdAt,
      final String? note,
      final HighlightColor? highlightColor}) = _$FavoriteVerseImpl;

  factory _FavoriteVerse.fromJson(Map<String, dynamic> json) =
      _$FavoriteVerseImpl.fromJson;

  @override
  String get id;
  @override
  String get bookName;
  @override
  int get chapter;
  @override
  int get verse;
  @override
  String get text;
  @override
  DateTime get createdAt;
  @override
  String? get note;
  @override
  HighlightColor? get highlightColor;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteVerseImplCopyWith<_$FavoriteVerseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingPlan _$ReadingPlanFromJson(Map<String, dynamic> json) {
  return _ReadingPlan.fromJson(json);
}

/// @nodoc
mixin _$ReadingPlan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get durationDays => throw _privateConstructorUsedError;
  List<ReadingDay> get days => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  int? get currentDay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingPlanCopyWith<ReadingPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingPlanCopyWith<$Res> {
  factory $ReadingPlanCopyWith(
          ReadingPlan value, $Res Function(ReadingPlan) then) =
      _$ReadingPlanCopyWithImpl<$Res, ReadingPlan>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int durationDays,
      List<ReadingDay> days,
      DateTime createdAt,
      DateTime? completedAt,
      int? currentDay});
}

/// @nodoc
class _$ReadingPlanCopyWithImpl<$Res, $Val extends ReadingPlan>
    implements $ReadingPlanCopyWith<$Res> {
  _$ReadingPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? durationDays = null,
    Object? days = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? currentDay = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<ReadingDay>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentDay: freezed == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingPlanImplCopyWith<$Res>
    implements $ReadingPlanCopyWith<$Res> {
  factory _$$ReadingPlanImplCopyWith(
          _$ReadingPlanImpl value, $Res Function(_$ReadingPlanImpl) then) =
      __$$ReadingPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int durationDays,
      List<ReadingDay> days,
      DateTime createdAt,
      DateTime? completedAt,
      int? currentDay});
}

/// @nodoc
class __$$ReadingPlanImplCopyWithImpl<$Res>
    extends _$ReadingPlanCopyWithImpl<$Res, _$ReadingPlanImpl>
    implements _$$ReadingPlanImplCopyWith<$Res> {
  __$$ReadingPlanImplCopyWithImpl(
      _$ReadingPlanImpl _value, $Res Function(_$ReadingPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? durationDays = null,
    Object? days = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? currentDay = freezed,
  }) {
    return _then(_$ReadingPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<ReadingDay>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentDay: freezed == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingPlanImpl implements _ReadingPlan {
  const _$ReadingPlanImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.durationDays,
      required final List<ReadingDay> days,
      required this.createdAt,
      this.completedAt,
      this.currentDay})
      : _days = days;

  factory _$ReadingPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingPlanImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int durationDays;
  final List<ReadingDay> _days;
  @override
  List<ReadingDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  @override
  final int? currentDay;

  @override
  String toString() {
    return 'ReadingPlan(id: $id, name: $name, description: $description, durationDays: $durationDays, days: $days, createdAt: $createdAt, completedAt: $completedAt, currentDay: $currentDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.currentDay, currentDay) ||
                other.currentDay == currentDay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      durationDays,
      const DeepCollectionEquality().hash(_days),
      createdAt,
      completedAt,
      currentDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingPlanImplCopyWith<_$ReadingPlanImpl> get copyWith =>
      __$$ReadingPlanImplCopyWithImpl<_$ReadingPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingPlanImplToJson(
      this,
    );
  }
}

abstract class _ReadingPlan implements ReadingPlan {
  const factory _ReadingPlan(
      {required final String id,
      required final String name,
      required final String description,
      required final int durationDays,
      required final List<ReadingDay> days,
      required final DateTime createdAt,
      final DateTime? completedAt,
      final int? currentDay}) = _$ReadingPlanImpl;

  factory _ReadingPlan.fromJson(Map<String, dynamic> json) =
      _$ReadingPlanImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get durationDays;
  @override
  List<ReadingDay> get days;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  int? get currentDay;
  @override
  @JsonKey(ignore: true)
  _$$ReadingPlanImplCopyWith<_$ReadingPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingDay _$ReadingDayFromJson(Map<String, dynamic> json) {
  return _ReadingDay.fromJson(json);
}

/// @nodoc
mixin _$ReadingDay {
  int get day => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<BibleReference> get readings => throw _privateConstructorUsedError;
  String? get reflection => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingDayCopyWith<ReadingDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingDayCopyWith<$Res> {
  factory $ReadingDayCopyWith(
          ReadingDay value, $Res Function(ReadingDay) then) =
      _$ReadingDayCopyWithImpl<$Res, ReadingDay>;
  @useResult
  $Res call(
      {int day,
      String title,
      List<BibleReference> readings,
      String? reflection,
      bool? completed});
}

/// @nodoc
class _$ReadingDayCopyWithImpl<$Res, $Val extends ReadingDay>
    implements $ReadingDayCopyWith<$Res> {
  _$ReadingDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? title = null,
    Object? readings = null,
    Object? reflection = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      readings: null == readings
          ? _value.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<BibleReference>,
      reflection: freezed == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingDayImplCopyWith<$Res>
    implements $ReadingDayCopyWith<$Res> {
  factory _$$ReadingDayImplCopyWith(
          _$ReadingDayImpl value, $Res Function(_$ReadingDayImpl) then) =
      __$$ReadingDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int day,
      String title,
      List<BibleReference> readings,
      String? reflection,
      bool? completed});
}

/// @nodoc
class __$$ReadingDayImplCopyWithImpl<$Res>
    extends _$ReadingDayCopyWithImpl<$Res, _$ReadingDayImpl>
    implements _$$ReadingDayImplCopyWith<$Res> {
  __$$ReadingDayImplCopyWithImpl(
      _$ReadingDayImpl _value, $Res Function(_$ReadingDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? title = null,
    Object? readings = null,
    Object? reflection = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$ReadingDayImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      readings: null == readings
          ? _value._readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<BibleReference>,
      reflection: freezed == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingDayImpl implements _ReadingDay {
  const _$ReadingDayImpl(
      {required this.day,
      required this.title,
      required final List<BibleReference> readings,
      this.reflection,
      this.completed})
      : _readings = readings;

  factory _$ReadingDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingDayImplFromJson(json);

  @override
  final int day;
  @override
  final String title;
  final List<BibleReference> _readings;
  @override
  List<BibleReference> get readings {
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  @override
  final String? reflection;
  @override
  final bool? completed;

  @override
  String toString() {
    return 'ReadingDay(day: $day, title: $title, readings: $readings, reflection: $reflection, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingDayImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            (identical(other.reflection, reflection) ||
                other.reflection == reflection) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, title,
      const DeepCollectionEquality().hash(_readings), reflection, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingDayImplCopyWith<_$ReadingDayImpl> get copyWith =>
      __$$ReadingDayImplCopyWithImpl<_$ReadingDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingDayImplToJson(
      this,
    );
  }
}

abstract class _ReadingDay implements ReadingDay {
  const factory _ReadingDay(
      {required final int day,
      required final String title,
      required final List<BibleReference> readings,
      final String? reflection,
      final bool? completed}) = _$ReadingDayImpl;

  factory _ReadingDay.fromJson(Map<String, dynamic> json) =
      _$ReadingDayImpl.fromJson;

  @override
  int get day;
  @override
  String get title;
  @override
  List<BibleReference> get readings;
  @override
  String? get reflection;
  @override
  bool? get completed;
  @override
  @JsonKey(ignore: true)
  _$$ReadingDayImplCopyWith<_$ReadingDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyReflection _$DailyReflectionFromJson(Map<String, dynamic> json) {
  return _DailyReflection.fromJson(json);
}

/// @nodoc
mixin _$DailyReflection {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get verse => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get reflection => throw _privateConstructorUsedError;
  String get bookName => throw _privateConstructorUsedError;
  int get chapter => throw _privateConstructorUsedError;
  int get verseNumber => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyReflectionCopyWith<DailyReflection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReflectionCopyWith<$Res> {
  factory $DailyReflectionCopyWith(
          DailyReflection value, $Res Function(DailyReflection) then) =
      _$DailyReflectionCopyWithImpl<$Res, DailyReflection>;
  @useResult
  $Res call(
      {String id,
      String title,
      String verse,
      String text,
      String reflection,
      String bookName,
      int chapter,
      int verseNumber,
      DateTime date});
}

/// @nodoc
class _$DailyReflectionCopyWithImpl<$Res, $Val extends DailyReflection>
    implements $DailyReflectionCopyWith<$Res> {
  _$DailyReflectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? verse = null,
    Object? text = null,
    Object? reflection = null,
    Object? bookName = null,
    Object? chapter = null,
    Object? verseNumber = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      reflection: null == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verseNumber: null == verseNumber
          ? _value.verseNumber
          : verseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyReflectionImplCopyWith<$Res>
    implements $DailyReflectionCopyWith<$Res> {
  factory _$$DailyReflectionImplCopyWith(_$DailyReflectionImpl value,
          $Res Function(_$DailyReflectionImpl) then) =
      __$$DailyReflectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String verse,
      String text,
      String reflection,
      String bookName,
      int chapter,
      int verseNumber,
      DateTime date});
}

/// @nodoc
class __$$DailyReflectionImplCopyWithImpl<$Res>
    extends _$DailyReflectionCopyWithImpl<$Res, _$DailyReflectionImpl>
    implements _$$DailyReflectionImplCopyWith<$Res> {
  __$$DailyReflectionImplCopyWithImpl(
      _$DailyReflectionImpl _value, $Res Function(_$DailyReflectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? verse = null,
    Object? text = null,
    Object? reflection = null,
    Object? bookName = null,
    Object? chapter = null,
    Object? verseNumber = null,
    Object? date = null,
  }) {
    return _then(_$DailyReflectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      verse: null == verse
          ? _value.verse
          : verse // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      reflection: null == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as String,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verseNumber: null == verseNumber
          ? _value.verseNumber
          : verseNumber // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyReflectionImpl implements _DailyReflection {
  const _$DailyReflectionImpl(
      {required this.id,
      required this.title,
      required this.verse,
      required this.text,
      required this.reflection,
      required this.bookName,
      required this.chapter,
      required this.verseNumber,
      required this.date});

  factory _$DailyReflectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyReflectionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String verse;
  @override
  final String text;
  @override
  final String reflection;
  @override
  final String bookName;
  @override
  final int chapter;
  @override
  final int verseNumber;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'DailyReflection(id: $id, title: $title, verse: $verse, text: $text, reflection: $reflection, bookName: $bookName, chapter: $chapter, verseNumber: $verseNumber, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyReflectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.verse, verse) || other.verse == verse) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.reflection, reflection) ||
                other.reflection == reflection) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.verseNumber, verseNumber) ||
                other.verseNumber == verseNumber) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, verse, text,
      reflection, bookName, chapter, verseNumber, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyReflectionImplCopyWith<_$DailyReflectionImpl> get copyWith =>
      __$$DailyReflectionImplCopyWithImpl<_$DailyReflectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyReflectionImplToJson(
      this,
    );
  }
}

abstract class _DailyReflection implements DailyReflection {
  const factory _DailyReflection(
      {required final String id,
      required final String title,
      required final String verse,
      required final String text,
      required final String reflection,
      required final String bookName,
      required final int chapter,
      required final int verseNumber,
      required final DateTime date}) = _$DailyReflectionImpl;

  factory _DailyReflection.fromJson(Map<String, dynamic> json) =
      _$DailyReflectionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get verse;
  @override
  String get text;
  @override
  String get reflection;
  @override
  String get bookName;
  @override
  int get chapter;
  @override
  int get verseNumber;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$DailyReflectionImplCopyWith<_$DailyReflectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LiturgyResponse {
  String get data => throw _privateConstructorUsedError;
  String get liturgia => throw _privateConstructorUsedError;
  String get cor => throw _privateConstructorUsedError;
  String get dia => throw _privateConstructorUsedError;
  String get ofertas => throw _privateConstructorUsedError;
  String get comunhao => throw _privateConstructorUsedError;
  LiturgyReading get primeiraLeitura => throw _privateConstructorUsedError;
  LiturgyReading? get segundaLeitura => throw _privateConstructorUsedError;
  LiturgySalmo get salmo => throw _privateConstructorUsedError;
  LiturgyReading get evangelho => throw _privateConstructorUsedError;
  LiturgyAntifonas get antifonas => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiturgyResponseCopyWith<LiturgyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiturgyResponseCopyWith<$Res> {
  factory $LiturgyResponseCopyWith(
          LiturgyResponse value, $Res Function(LiturgyResponse) then) =
      _$LiturgyResponseCopyWithImpl<$Res, LiturgyResponse>;
  @useResult
  $Res call(
      {String data,
      String liturgia,
      String cor,
      String dia,
      String ofertas,
      String comunhao,
      LiturgyReading primeiraLeitura,
      LiturgyReading? segundaLeitura,
      LiturgySalmo salmo,
      LiturgyReading evangelho,
      LiturgyAntifonas antifonas});

  $LiturgyReadingCopyWith<$Res> get primeiraLeitura;
  $LiturgyReadingCopyWith<$Res>? get segundaLeitura;
  $LiturgySalmoCopyWith<$Res> get salmo;
  $LiturgyReadingCopyWith<$Res> get evangelho;
  $LiturgyAntifonasCopyWith<$Res> get antifonas;
}

/// @nodoc
class _$LiturgyResponseCopyWithImpl<$Res, $Val extends LiturgyResponse>
    implements $LiturgyResponseCopyWith<$Res> {
  _$LiturgyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? liturgia = null,
    Object? cor = null,
    Object? dia = null,
    Object? ofertas = null,
    Object? comunhao = null,
    Object? primeiraLeitura = null,
    Object? segundaLeitura = freezed,
    Object? salmo = null,
    Object? evangelho = null,
    Object? antifonas = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      liturgia: null == liturgia
          ? _value.liturgia
          : liturgia // ignore: cast_nullable_to_non_nullable
              as String,
      cor: null == cor
          ? _value.cor
          : cor // ignore: cast_nullable_to_non_nullable
              as String,
      dia: null == dia
          ? _value.dia
          : dia // ignore: cast_nullable_to_non_nullable
              as String,
      ofertas: null == ofertas
          ? _value.ofertas
          : ofertas // ignore: cast_nullable_to_non_nullable
              as String,
      comunhao: null == comunhao
          ? _value.comunhao
          : comunhao // ignore: cast_nullable_to_non_nullable
              as String,
      primeiraLeitura: null == primeiraLeitura
          ? _value.primeiraLeitura
          : primeiraLeitura // ignore: cast_nullable_to_non_nullable
              as LiturgyReading,
      segundaLeitura: freezed == segundaLeitura
          ? _value.segundaLeitura
          : segundaLeitura // ignore: cast_nullable_to_non_nullable
              as LiturgyReading?,
      salmo: null == salmo
          ? _value.salmo
          : salmo // ignore: cast_nullable_to_non_nullable
              as LiturgySalmo,
      evangelho: null == evangelho
          ? _value.evangelho
          : evangelho // ignore: cast_nullable_to_non_nullable
              as LiturgyReading,
      antifonas: null == antifonas
          ? _value.antifonas
          : antifonas // ignore: cast_nullable_to_non_nullable
              as LiturgyAntifonas,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LiturgyReadingCopyWith<$Res> get primeiraLeitura {
    return $LiturgyReadingCopyWith<$Res>(_value.primeiraLeitura, (value) {
      return _then(_value.copyWith(primeiraLeitura: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LiturgyReadingCopyWith<$Res>? get segundaLeitura {
    if (_value.segundaLeitura == null) {
      return null;
    }

    return $LiturgyReadingCopyWith<$Res>(_value.segundaLeitura!, (value) {
      return _then(_value.copyWith(segundaLeitura: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LiturgySalmoCopyWith<$Res> get salmo {
    return $LiturgySalmoCopyWith<$Res>(_value.salmo, (value) {
      return _then(_value.copyWith(salmo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LiturgyReadingCopyWith<$Res> get evangelho {
    return $LiturgyReadingCopyWith<$Res>(_value.evangelho, (value) {
      return _then(_value.copyWith(evangelho: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LiturgyAntifonasCopyWith<$Res> get antifonas {
    return $LiturgyAntifonasCopyWith<$Res>(_value.antifonas, (value) {
      return _then(_value.copyWith(antifonas: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiturgyResponseImplCopyWith<$Res>
    implements $LiturgyResponseCopyWith<$Res> {
  factory _$$LiturgyResponseImplCopyWith(_$LiturgyResponseImpl value,
          $Res Function(_$LiturgyResponseImpl) then) =
      __$$LiturgyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String data,
      String liturgia,
      String cor,
      String dia,
      String ofertas,
      String comunhao,
      LiturgyReading primeiraLeitura,
      LiturgyReading? segundaLeitura,
      LiturgySalmo salmo,
      LiturgyReading evangelho,
      LiturgyAntifonas antifonas});

  @override
  $LiturgyReadingCopyWith<$Res> get primeiraLeitura;
  @override
  $LiturgyReadingCopyWith<$Res>? get segundaLeitura;
  @override
  $LiturgySalmoCopyWith<$Res> get salmo;
  @override
  $LiturgyReadingCopyWith<$Res> get evangelho;
  @override
  $LiturgyAntifonasCopyWith<$Res> get antifonas;
}

/// @nodoc
class __$$LiturgyResponseImplCopyWithImpl<$Res>
    extends _$LiturgyResponseCopyWithImpl<$Res, _$LiturgyResponseImpl>
    implements _$$LiturgyResponseImplCopyWith<$Res> {
  __$$LiturgyResponseImplCopyWithImpl(
      _$LiturgyResponseImpl _value, $Res Function(_$LiturgyResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? liturgia = null,
    Object? cor = null,
    Object? dia = null,
    Object? ofertas = null,
    Object? comunhao = null,
    Object? primeiraLeitura = null,
    Object? segundaLeitura = freezed,
    Object? salmo = null,
    Object? evangelho = null,
    Object? antifonas = null,
  }) {
    return _then(_$LiturgyResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      liturgia: null == liturgia
          ? _value.liturgia
          : liturgia // ignore: cast_nullable_to_non_nullable
              as String,
      cor: null == cor
          ? _value.cor
          : cor // ignore: cast_nullable_to_non_nullable
              as String,
      dia: null == dia
          ? _value.dia
          : dia // ignore: cast_nullable_to_non_nullable
              as String,
      ofertas: null == ofertas
          ? _value.ofertas
          : ofertas // ignore: cast_nullable_to_non_nullable
              as String,
      comunhao: null == comunhao
          ? _value.comunhao
          : comunhao // ignore: cast_nullable_to_non_nullable
              as String,
      primeiraLeitura: null == primeiraLeitura
          ? _value.primeiraLeitura
          : primeiraLeitura // ignore: cast_nullable_to_non_nullable
              as LiturgyReading,
      segundaLeitura: freezed == segundaLeitura
          ? _value.segundaLeitura
          : segundaLeitura // ignore: cast_nullable_to_non_nullable
              as LiturgyReading?,
      salmo: null == salmo
          ? _value.salmo
          : salmo // ignore: cast_nullable_to_non_nullable
              as LiturgySalmo,
      evangelho: null == evangelho
          ? _value.evangelho
          : evangelho // ignore: cast_nullable_to_non_nullable
              as LiturgyReading,
      antifonas: null == antifonas
          ? _value.antifonas
          : antifonas // ignore: cast_nullable_to_non_nullable
              as LiturgyAntifonas,
    ));
  }
}

/// @nodoc

class _$LiturgyResponseImpl implements _LiturgyResponse {
  const _$LiturgyResponseImpl(
      {required this.data,
      required this.liturgia,
      required this.cor,
      required this.dia,
      required this.ofertas,
      required this.comunhao,
      required this.primeiraLeitura,
      this.segundaLeitura,
      required this.salmo,
      required this.evangelho,
      required this.antifonas});

  @override
  final String data;
  @override
  final String liturgia;
  @override
  final String cor;
  @override
  final String dia;
  @override
  final String ofertas;
  @override
  final String comunhao;
  @override
  final LiturgyReading primeiraLeitura;
  @override
  final LiturgyReading? segundaLeitura;
  @override
  final LiturgySalmo salmo;
  @override
  final LiturgyReading evangelho;
  @override
  final LiturgyAntifonas antifonas;

  @override
  String toString() {
    return 'LiturgyResponse(data: $data, liturgia: $liturgia, cor: $cor, dia: $dia, ofertas: $ofertas, comunhao: $comunhao, primeiraLeitura: $primeiraLeitura, segundaLeitura: $segundaLeitura, salmo: $salmo, evangelho: $evangelho, antifonas: $antifonas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiturgyResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.liturgia, liturgia) ||
                other.liturgia == liturgia) &&
            (identical(other.cor, cor) || other.cor == cor) &&
            (identical(other.dia, dia) || other.dia == dia) &&
            (identical(other.ofertas, ofertas) || other.ofertas == ofertas) &&
            (identical(other.comunhao, comunhao) ||
                other.comunhao == comunhao) &&
            (identical(other.primeiraLeitura, primeiraLeitura) ||
                other.primeiraLeitura == primeiraLeitura) &&
            (identical(other.segundaLeitura, segundaLeitura) ||
                other.segundaLeitura == segundaLeitura) &&
            (identical(other.salmo, salmo) || other.salmo == salmo) &&
            (identical(other.evangelho, evangelho) ||
                other.evangelho == evangelho) &&
            (identical(other.antifonas, antifonas) ||
                other.antifonas == antifonas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      data,
      liturgia,
      cor,
      dia,
      ofertas,
      comunhao,
      primeiraLeitura,
      segundaLeitura,
      salmo,
      evangelho,
      antifonas);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiturgyResponseImplCopyWith<_$LiturgyResponseImpl> get copyWith =>
      __$$LiturgyResponseImplCopyWithImpl<_$LiturgyResponseImpl>(
          this, _$identity);
}

abstract class _LiturgyResponse implements LiturgyResponse {
  const factory _LiturgyResponse(
      {required final String data,
      required final String liturgia,
      required final String cor,
      required final String dia,
      required final String ofertas,
      required final String comunhao,
      required final LiturgyReading primeiraLeitura,
      final LiturgyReading? segundaLeitura,
      required final LiturgySalmo salmo,
      required final LiturgyReading evangelho,
      required final LiturgyAntifonas antifonas}) = _$LiturgyResponseImpl;

  @override
  String get data;
  @override
  String get liturgia;
  @override
  String get cor;
  @override
  String get dia;
  @override
  String get ofertas;
  @override
  String get comunhao;
  @override
  LiturgyReading get primeiraLeitura;
  @override
  LiturgyReading? get segundaLeitura;
  @override
  LiturgySalmo get salmo;
  @override
  LiturgyReading get evangelho;
  @override
  LiturgyAntifonas get antifonas;
  @override
  @JsonKey(ignore: true)
  _$$LiturgyResponseImplCopyWith<_$LiturgyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiturgyReading _$LiturgyReadingFromJson(Map<String, dynamic> json) {
  return _LiturgyReading.fromJson(json);
}

/// @nodoc
mixin _$LiturgyReading {
  String get referencia => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String get texto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiturgyReadingCopyWith<LiturgyReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiturgyReadingCopyWith<$Res> {
  factory $LiturgyReadingCopyWith(
          LiturgyReading value, $Res Function(LiturgyReading) then) =
      _$LiturgyReadingCopyWithImpl<$Res, LiturgyReading>;
  @useResult
  $Res call({String referencia, String titulo, String texto});
}

/// @nodoc
class _$LiturgyReadingCopyWithImpl<$Res, $Val extends LiturgyReading>
    implements $LiturgyReadingCopyWith<$Res> {
  _$LiturgyReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? titulo = null,
    Object? texto = null,
  }) {
    return _then(_value.copyWith(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      titulo: null == titulo
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiturgyReadingImplCopyWith<$Res>
    implements $LiturgyReadingCopyWith<$Res> {
  factory _$$LiturgyReadingImplCopyWith(_$LiturgyReadingImpl value,
          $Res Function(_$LiturgyReadingImpl) then) =
      __$$LiturgyReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String referencia, String titulo, String texto});
}

/// @nodoc
class __$$LiturgyReadingImplCopyWithImpl<$Res>
    extends _$LiturgyReadingCopyWithImpl<$Res, _$LiturgyReadingImpl>
    implements _$$LiturgyReadingImplCopyWith<$Res> {
  __$$LiturgyReadingImplCopyWithImpl(
      _$LiturgyReadingImpl _value, $Res Function(_$LiturgyReadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? titulo = null,
    Object? texto = null,
  }) {
    return _then(_$LiturgyReadingImpl(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      titulo: null == titulo
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiturgyReadingImpl implements _LiturgyReading {
  const _$LiturgyReadingImpl(
      {required this.referencia, required this.titulo, required this.texto});

  factory _$LiturgyReadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiturgyReadingImplFromJson(json);

  @override
  final String referencia;
  @override
  final String titulo;
  @override
  final String texto;

  @override
  String toString() {
    return 'LiturgyReading(referencia: $referencia, titulo: $titulo, texto: $texto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiturgyReadingImpl &&
            (identical(other.referencia, referencia) ||
                other.referencia == referencia) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.texto, texto) || other.texto == texto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referencia, titulo, texto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiturgyReadingImplCopyWith<_$LiturgyReadingImpl> get copyWith =>
      __$$LiturgyReadingImplCopyWithImpl<_$LiturgyReadingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiturgyReadingImplToJson(
      this,
    );
  }
}

abstract class _LiturgyReading implements LiturgyReading {
  const factory _LiturgyReading(
      {required final String referencia,
      required final String titulo,
      required final String texto}) = _$LiturgyReadingImpl;

  factory _LiturgyReading.fromJson(Map<String, dynamic> json) =
      _$LiturgyReadingImpl.fromJson;

  @override
  String get referencia;
  @override
  String get titulo;
  @override
  String get texto;
  @override
  @JsonKey(ignore: true)
  _$$LiturgyReadingImplCopyWith<_$LiturgyReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiturgySalmo _$LiturgySalmoFromJson(Map<String, dynamic> json) {
  return _LiturgySalmo.fromJson(json);
}

/// @nodoc
mixin _$LiturgySalmo {
  String get referencia => throw _privateConstructorUsedError;
  String get refrao => throw _privateConstructorUsedError;
  String get texto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiturgySalmoCopyWith<LiturgySalmo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiturgySalmoCopyWith<$Res> {
  factory $LiturgySalmoCopyWith(
          LiturgySalmo value, $Res Function(LiturgySalmo) then) =
      _$LiturgySalmoCopyWithImpl<$Res, LiturgySalmo>;
  @useResult
  $Res call({String referencia, String refrao, String texto});
}

/// @nodoc
class _$LiturgySalmoCopyWithImpl<$Res, $Val extends LiturgySalmo>
    implements $LiturgySalmoCopyWith<$Res> {
  _$LiturgySalmoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? refrao = null,
    Object? texto = null,
  }) {
    return _then(_value.copyWith(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      refrao: null == refrao
          ? _value.refrao
          : refrao // ignore: cast_nullable_to_non_nullable
              as String,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiturgySalmoImplCopyWith<$Res>
    implements $LiturgySalmoCopyWith<$Res> {
  factory _$$LiturgySalmoImplCopyWith(
          _$LiturgySalmoImpl value, $Res Function(_$LiturgySalmoImpl) then) =
      __$$LiturgySalmoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String referencia, String refrao, String texto});
}

/// @nodoc
class __$$LiturgySalmoImplCopyWithImpl<$Res>
    extends _$LiturgySalmoCopyWithImpl<$Res, _$LiturgySalmoImpl>
    implements _$$LiturgySalmoImplCopyWith<$Res> {
  __$$LiturgySalmoImplCopyWithImpl(
      _$LiturgySalmoImpl _value, $Res Function(_$LiturgySalmoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? refrao = null,
    Object? texto = null,
  }) {
    return _then(_$LiturgySalmoImpl(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      refrao: null == refrao
          ? _value.refrao
          : refrao // ignore: cast_nullable_to_non_nullable
              as String,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiturgySalmoImpl implements _LiturgySalmo {
  const _$LiturgySalmoImpl(
      {required this.referencia, required this.refrao, required this.texto});

  factory _$LiturgySalmoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiturgySalmoImplFromJson(json);

  @override
  final String referencia;
  @override
  final String refrao;
  @override
  final String texto;

  @override
  String toString() {
    return 'LiturgySalmo(referencia: $referencia, refrao: $refrao, texto: $texto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiturgySalmoImpl &&
            (identical(other.referencia, referencia) ||
                other.referencia == referencia) &&
            (identical(other.refrao, refrao) || other.refrao == refrao) &&
            (identical(other.texto, texto) || other.texto == texto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referencia, refrao, texto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiturgySalmoImplCopyWith<_$LiturgySalmoImpl> get copyWith =>
      __$$LiturgySalmoImplCopyWithImpl<_$LiturgySalmoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiturgySalmoImplToJson(
      this,
    );
  }
}

abstract class _LiturgySalmo implements LiturgySalmo {
  const factory _LiturgySalmo(
      {required final String referencia,
      required final String refrao,
      required final String texto}) = _$LiturgySalmoImpl;

  factory _LiturgySalmo.fromJson(Map<String, dynamic> json) =
      _$LiturgySalmoImpl.fromJson;

  @override
  String get referencia;
  @override
  String get refrao;
  @override
  String get texto;
  @override
  @JsonKey(ignore: true)
  _$$LiturgySalmoImplCopyWith<_$LiturgySalmoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiturgyAntifonas _$LiturgyAntifonasFromJson(Map<String, dynamic> json) {
  return _LiturgyAntifonas.fromJson(json);
}

/// @nodoc
mixin _$LiturgyAntifonas {
  String get entrada => throw _privateConstructorUsedError;
  String get comunhao => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiturgyAntifonasCopyWith<LiturgyAntifonas> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiturgyAntifonasCopyWith<$Res> {
  factory $LiturgyAntifonasCopyWith(
          LiturgyAntifonas value, $Res Function(LiturgyAntifonas) then) =
      _$LiturgyAntifonasCopyWithImpl<$Res, LiturgyAntifonas>;
  @useResult
  $Res call({String entrada, String comunhao});
}

/// @nodoc
class _$LiturgyAntifonasCopyWithImpl<$Res, $Val extends LiturgyAntifonas>
    implements $LiturgyAntifonasCopyWith<$Res> {
  _$LiturgyAntifonasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entrada = null,
    Object? comunhao = null,
  }) {
    return _then(_value.copyWith(
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as String,
      comunhao: null == comunhao
          ? _value.comunhao
          : comunhao // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiturgyAntifonasImplCopyWith<$Res>
    implements $LiturgyAntifonasCopyWith<$Res> {
  factory _$$LiturgyAntifonasImplCopyWith(_$LiturgyAntifonasImpl value,
          $Res Function(_$LiturgyAntifonasImpl) then) =
      __$$LiturgyAntifonasImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String entrada, String comunhao});
}

/// @nodoc
class __$$LiturgyAntifonasImplCopyWithImpl<$Res>
    extends _$LiturgyAntifonasCopyWithImpl<$Res, _$LiturgyAntifonasImpl>
    implements _$$LiturgyAntifonasImplCopyWith<$Res> {
  __$$LiturgyAntifonasImplCopyWithImpl(_$LiturgyAntifonasImpl _value,
      $Res Function(_$LiturgyAntifonasImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entrada = null,
    Object? comunhao = null,
  }) {
    return _then(_$LiturgyAntifonasImpl(
      entrada: null == entrada
          ? _value.entrada
          : entrada // ignore: cast_nullable_to_non_nullable
              as String,
      comunhao: null == comunhao
          ? _value.comunhao
          : comunhao // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiturgyAntifonasImpl implements _LiturgyAntifonas {
  const _$LiturgyAntifonasImpl({required this.entrada, required this.comunhao});

  factory _$LiturgyAntifonasImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiturgyAntifonasImplFromJson(json);

  @override
  final String entrada;
  @override
  final String comunhao;

  @override
  String toString() {
    return 'LiturgyAntifonas(entrada: $entrada, comunhao: $comunhao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiturgyAntifonasImpl &&
            (identical(other.entrada, entrada) || other.entrada == entrada) &&
            (identical(other.comunhao, comunhao) ||
                other.comunhao == comunhao));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entrada, comunhao);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiturgyAntifonasImplCopyWith<_$LiturgyAntifonasImpl> get copyWith =>
      __$$LiturgyAntifonasImplCopyWithImpl<_$LiturgyAntifonasImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiturgyAntifonasImplToJson(
      this,
    );
  }
}

abstract class _LiturgyAntifonas implements LiturgyAntifonas {
  const factory _LiturgyAntifonas(
      {required final String entrada,
      required final String comunhao}) = _$LiturgyAntifonasImpl;

  factory _LiturgyAntifonas.fromJson(Map<String, dynamic> json) =
      _$LiturgyAntifonasImpl.fromJson;

  @override
  String get entrada;
  @override
  String get comunhao;
  @override
  @JsonKey(ignore: true)
  _$$LiturgyAntifonasImplCopyWith<_$LiturgyAntifonasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
