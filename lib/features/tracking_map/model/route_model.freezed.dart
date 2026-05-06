// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RouteModel {

 List<Position> get points; String get originName; String get destinationName; int get durationSeconds; double get distanceMeters;
/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteModelCopyWith<RouteModel> get copyWith => _$RouteModelCopyWithImpl<RouteModel>(this as RouteModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteModel&&const DeepCollectionEquality().equals(other.points, points)&&(identical(other.originName, originName) || other.originName == originName)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points),originName,destinationName,durationSeconds,distanceMeters);

@override
String toString() {
  return 'RouteModel(points: $points, originName: $originName, destinationName: $destinationName, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class $RouteModelCopyWith<$Res>  {
  factory $RouteModelCopyWith(RouteModel value, $Res Function(RouteModel) _then) = _$RouteModelCopyWithImpl;
@useResult
$Res call({
 List<Position> points, String originName, String destinationName, int durationSeconds, double distanceMeters
});




}
/// @nodoc
class _$RouteModelCopyWithImpl<$Res>
    implements $RouteModelCopyWith<$Res> {
  _$RouteModelCopyWithImpl(this._self, this._then);

  final RouteModel _self;
  final $Res Function(RouteModel) _then;

/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? originName = null,Object? destinationName = null,Object? durationSeconds = null,Object? distanceMeters = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<Position>,originName: null == originName ? _self.originName : originName // ignore: cast_nullable_to_non_nullable
as String,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteModel].
extension RouteModelPatterns on RouteModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Position> points,  String originName,  String destinationName,  int durationSeconds,  double distanceMeters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
return $default(_that.points,_that.originName,_that.destinationName,_that.durationSeconds,_that.distanceMeters);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Position> points,  String originName,  String destinationName,  int durationSeconds,  double distanceMeters)  $default,) {final _that = this;
switch (_that) {
case _RouteModel():
return $default(_that.points,_that.originName,_that.destinationName,_that.durationSeconds,_that.distanceMeters);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Position> points,  String originName,  String destinationName,  int durationSeconds,  double distanceMeters)?  $default,) {final _that = this;
switch (_that) {
case _RouteModel() when $default != null:
return $default(_that.points,_that.originName,_that.destinationName,_that.durationSeconds,_that.distanceMeters);case _:
  return null;

}
}

}

/// @nodoc


class _RouteModel implements RouteModel {
  const _RouteModel({required final  List<Position> points, required this.originName, required this.destinationName, required this.durationSeconds, required this.distanceMeters}): _points = points;
  

 final  List<Position> _points;
@override List<Position> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

@override final  String originName;
@override final  String destinationName;
@override final  int durationSeconds;
@override final  double distanceMeters;

/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteModelCopyWith<_RouteModel> get copyWith => __$RouteModelCopyWithImpl<_RouteModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteModel&&const DeepCollectionEquality().equals(other._points, _points)&&(identical(other.originName, originName) || other.originName == originName)&&(identical(other.destinationName, destinationName) || other.destinationName == destinationName)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),originName,destinationName,durationSeconds,distanceMeters);

@override
String toString() {
  return 'RouteModel(points: $points, originName: $originName, destinationName: $destinationName, durationSeconds: $durationSeconds, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class _$RouteModelCopyWith<$Res> implements $RouteModelCopyWith<$Res> {
  factory _$RouteModelCopyWith(_RouteModel value, $Res Function(_RouteModel) _then) = __$RouteModelCopyWithImpl;
@override @useResult
$Res call({
 List<Position> points, String originName, String destinationName, int durationSeconds, double distanceMeters
});




}
/// @nodoc
class __$RouteModelCopyWithImpl<$Res>
    implements _$RouteModelCopyWith<$Res> {
  __$RouteModelCopyWithImpl(this._self, this._then);

  final _RouteModel _self;
  final $Res Function(_RouteModel) _then;

/// Create a copy of RouteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? originName = null,Object? destinationName = null,Object? durationSeconds = null,Object? distanceMeters = null,}) {
  return _then(_RouteModel(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<Position>,originName: null == originName ? _self.originName : originName // ignore: cast_nullable_to_non_nullable
as String,destinationName: null == destinationName ? _self.destinationName : destinationName // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
