// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationData {

 String get id; String get placeName; double get longitude; double get latitude;
/// Create a copy of LocationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationDataCopyWith<LocationData> get copyWith => _$LocationDataCopyWithImpl<LocationData>(this as LocationData, _$identity);

  /// Serializes this LocationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationData&&(identical(other.id, id) || other.id == id)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,placeName,longitude,latitude);

@override
String toString() {
  return 'LocationData(id: $id, placeName: $placeName, longitude: $longitude, latitude: $latitude)';
}


}

/// @nodoc
abstract mixin class $LocationDataCopyWith<$Res>  {
  factory $LocationDataCopyWith(LocationData value, $Res Function(LocationData) _then) = _$LocationDataCopyWithImpl;
@useResult
$Res call({
 String id, String placeName, double longitude, double latitude
});




}
/// @nodoc
class _$LocationDataCopyWithImpl<$Res>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._self, this._then);

  final LocationData _self;
  final $Res Function(LocationData) _then;

/// Create a copy of LocationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? placeName = null,Object? longitude = null,Object? latitude = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,placeName: null == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationData].
extension LocationDataPatterns on LocationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationData value)  $default,){
final _that = this;
switch (_that) {
case _LocationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationData value)?  $default,){
final _that = this;
switch (_that) {
case _LocationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String placeName,  double longitude,  double latitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationData() when $default != null:
return $default(_that.id,_that.placeName,_that.longitude,_that.latitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String placeName,  double longitude,  double latitude)  $default,) {final _that = this;
switch (_that) {
case _LocationData():
return $default(_that.id,_that.placeName,_that.longitude,_that.latitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String placeName,  double longitude,  double latitude)?  $default,) {final _that = this;
switch (_that) {
case _LocationData() when $default != null:
return $default(_that.id,_that.placeName,_that.longitude,_that.latitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationData implements LocationData {
  const _LocationData({required this.id, required this.placeName, required this.longitude, required this.latitude});
  factory _LocationData.fromJson(Map<String, dynamic> json) => _$LocationDataFromJson(json);

@override final  String id;
@override final  String placeName;
@override final  double longitude;
@override final  double latitude;

/// Create a copy of LocationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationDataCopyWith<_LocationData> get copyWith => __$LocationDataCopyWithImpl<_LocationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationData&&(identical(other.id, id) || other.id == id)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,placeName,longitude,latitude);

@override
String toString() {
  return 'LocationData(id: $id, placeName: $placeName, longitude: $longitude, latitude: $latitude)';
}


}

/// @nodoc
abstract mixin class _$LocationDataCopyWith<$Res> implements $LocationDataCopyWith<$Res> {
  factory _$LocationDataCopyWith(_LocationData value, $Res Function(_LocationData) _then) = __$LocationDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String placeName, double longitude, double latitude
});




}
/// @nodoc
class __$LocationDataCopyWithImpl<$Res>
    implements _$LocationDataCopyWith<$Res> {
  __$LocationDataCopyWithImpl(this._self, this._then);

  final _LocationData _self;
  final $Res Function(_LocationData) _then;

/// Create a copy of LocationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? placeName = null,Object? longitude = null,Object? latitude = null,}) {
  return _then(_LocationData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,placeName: null == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
