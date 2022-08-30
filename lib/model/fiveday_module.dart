/// lat : 51.5085
/// lon : -0.1257
/// timezone : "Europe/London"
/// timezone_offset : 0
/// daily : [{"dt":1638615600,"sunrise":1638604092,"sunset":1638633220,"moonrise":1638604980,"moonset":1638633120,"moon_phase":0,"temp":{"day":279.72,"min":278.25,"max":280.57,"night":278.42,"eve":278.84,"morn":278.91},"feels_like":{"day":276.05,"night":273.85,"eve":274.76,"morn":277.71},"pressure":999,"humidity":66,"dew_point":273.84,"wind_speed":7.46,"wind_deg":280,"wind_gust":15.55,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":100,"pop":0.86,"rain":0.56,"uvi":0.39},{"dt":1638702000,"sunrise":1638690568,"sunset":1638719592,"moonrise":1638696480,"moonset":1638722520,"moon_phase":0.05,"temp":{"day":277.39,"min":277.35,"max":279.38,"night":278.58,"eve":279.27,"morn":278.11},"feels_like":{"day":272.94,"night":275.44,"eve":275.56,"morn":273.69},"pressure":1006,"humidity":87,"dew_point":275.43,"wind_speed":7.86,"wind_deg":328,"wind_gust":15.42,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":100,"pop":0.76,"rain":2.14,"uvi":0.12},{"dt":1638788400,"sunrise":1638777042,"sunset":1638805968,"moonrise":1638787020,"moonset":1638813000,"moon_phase":0.09,"temp":{"day":278.62,"min":276.96,"max":279.89,"night":277.25,"eve":278.85,"morn":277.36},"feels_like":{"day":274.96,"night":273.09,"eve":274.65,"morn":275.74},"pressure":1007,"humidity":83,"dew_point":275.95,"wind_speed":8.72,"wind_deg":297,"wind_gust":15.14,"weather":[{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}],"clouds":100,"pop":1,"rain":5.23,"uvi":0.09},{"dt":1638874800,"sunrise":1638863514,"sunset":1638892346,"moonrise":1638876480,"moonset":1638904200,"moon_phase":0.12,"temp":{"day":277.74,"min":274.95,"max":279.71,"night":276.97,"eve":278.44,"morn":275.53},"feels_like":{"day":274.46,"night":273.94,"eve":273.6,"morn":272.58},"pressure":1006,"humidity":66,"dew_point":271.87,"wind_speed":8.32,"wind_deg":164,"wind_gust":17.01,"weather":[{"id":502,"main":"Rain","description":"heavy intensity rain","icon":"10d"}],"clouds":73,"pop":1,"rain":15.39,"uvi":0.43},{"dt":1638961200,"sunrise":1638949983,"sunset":1638978728,"moonrise":1638964980,"moonset":1638995640,"moon_phase":0.16,"temp":{"day":280.15,"min":277.06,"max":280.15,"night":279.05,"eve":279.69,"morn":277.06},"feels_like":{"day":276.77,"night":275.32,"eve":276,"morn":274.12},"pressure":992,"humidity":71,"dew_point":275.24,"wind_speed":5.99,"wind_deg":147,"wind_gust":12.53,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":43,"pop":1,"rain":2.11,"uvi":0.38},{"dt":1639047600,"sunrise":1639036450,"sunset":1639065114,"moonrise":1639052880,"moonset":1639087020,"moon_phase":0.2,"temp":{"day":279.35,"min":276.15,"max":279.35,"night":276.15,"eve":277.27,"morn":278.64},"feels_like":{"day":276.14,"night":274.77,"eve":274.93,"morn":274.58},"pressure":1006,"humidity":69,"dew_point":274.13,"wind_speed":6.49,"wind_deg":77,"wind_gust":12.79,"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"clouds":81,"pop":0.31,"rain":0.12,"uvi":0.43},{"dt":1639134000,"sunrise":1639122915,"sunset":1639151502,"moonrise":1639140420,"moonset":1639178160,"moon_phase":0.23,"temp":{"day":277.15,"min":274.98,"max":277.32,"night":275.89,"eve":276.94,"morn":274.98},"feels_like":{"day":274.5,"night":273.48,"eve":274.46,"morn":274.98},"pressure":999,"humidity":69,"dew_point":271.99,"wind_speed":3.26,"wind_deg":84,"wind_gust":7.2,"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"clouds":100,"pop":0.27,"uvi":1},{"dt":1639220400,"sunrise":1639209376,"sunset":1639237894,"moonrise":1639227720,"moonset":0,"moon_phase":0.25,"temp":{"day":277.29,"min":274.28,"max":277.29,"night":275.34,"eve":275.7,"morn":274.28},"feels_like":{"day":274.42,"night":273.74,"eve":274.32,"morn":271.28},"pressure":1016,"humidity":69,"dew_point":272.07,"wind_speed":3.28,"wind_deg":324,"wind_gust":9.33,"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02d"}],"clouds":11,"pop":0,"uvi":1}]

class FivedayModule {
  FivedayModule({
      double? lat, 
      double? lon, 
      String? timezone, 
      int? timezoneOffset, 
      List<Daily>? daily,}){
    _lat = lat;
    _lon = lon;
    _timezone = timezone;
    _timezoneOffset = timezoneOffset;
    _daily = daily;
}

  FivedayModule.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
    _timezone = json['timezone'];
    _timezoneOffset = json['timezone_offset'];
    if (json['daily'] != null) {
      _daily = [];
      json['daily'].forEach((v) {
        _daily?.add(Daily.fromJson(v));
      });
    }
  }
  double? _lat;
  double? _lon;
  String? _timezone;
  int? _timezoneOffset;
  List<Daily>? _daily;

  double? get lat => _lat;
  double? get lon => _lon;
  String? get timezone => _timezone;
  int? get timezoneOffset => _timezoneOffset;
  List<Daily>? get daily => _daily;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['timezone'] = _timezone;
    map['timezone_offset'] = _timezoneOffset;
    if (_daily != null) {
      map['daily'] = _daily?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// dt : 1638615600
/// sunrise : 1638604092
/// sunset : 1638633220
/// moonrise : 1638604980
/// moonset : 1638633120
/// moon_phase : 0
/// temp : {"day":279.72,"min":278.25,"max":280.57,"night":278.42,"eve":278.84,"morn":278.91}
/// feels_like : {"day":276.05,"night":273.85,"eve":274.76,"morn":277.71}
/// pressure : 999
/// humidity : 66
/// dew_point : 273.84
/// wind_speed : 7.46
/// wind_deg : 280
/// wind_gust : 15.55
/// weather : [{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]
/// clouds : 100
/// pop : 0.86
/// rain : 0.56
/// uvi : 0.39

class Daily {
  Daily({
      int? dt, 
      int? sunrise, 
      int? sunset, 
      int? moonrise, 
      int? moonset, 
      int? moonPhase, 
      Temp? temp, 
      Feels_like? feelsLike, 
      int? pressure, 
      int? humidity, 
      double? dewPoint, 
      double? windSpeed, 
      int? windDeg, 
      double? windGust, 
      List<Weather>? weather, 
      int? clouds, 
      double? pop, 
      double? rain, 
      double? uvi,}){
    _dt = dt;
    _sunrise = sunrise;
    _sunset = sunset;
    _moonrise = moonrise;
    _moonset = moonset;
    _moonPhase = moonPhase;
    _temp = temp;
    _feelsLike = feelsLike;
    _pressure = pressure;
    _humidity = humidity;
    _dewPoint = dewPoint;
    _windSpeed = windSpeed;
    _windDeg = windDeg;
    _windGust = windGust;
    _weather = weather;
    _clouds = clouds;
    _pop = pop;
    _rain = rain;
    _uvi = uvi;
}

  Daily.fromJson(dynamic json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    _feelsLike = json['feels_like'] != null ? Feels_like.fromJson(json['feelsLike']) : null;
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'];
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'];
    _pop = json['pop'];
    _rain = json['rain'];
    _uvi = json['uvi'];
  }
  int? _dt;
  int? _sunrise;
  int? _sunset;
  int? _moonrise;
  int? _moonset;
  int? _moonPhase;
  Temp? _temp;
  Feels_like? _feelsLike;
  int? _pressure;
  int? _humidity;
  double? _dewPoint;
  double? _windSpeed;
  int? _windDeg;
  double? _windGust;
  List<Weather>? _weather;
  int? _clouds;
  double? _pop;
  double? _rain;
  double? _uvi;

  int? get dt => _dt;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;
  int? get moonrise => _moonrise;
  int? get moonset => _moonset;
  int? get moonPhase => _moonPhase;
  Temp? get temp => _temp;
  Feels_like? get feelsLike => _feelsLike;
  int? get pressure => _pressure;
  int? get humidity => _humidity;
  double? get dewPoint => _dewPoint;
  double? get windSpeed => _windSpeed;
  int? get windDeg => _windDeg;
  double? get windGust => _windGust;
  List<Weather>? get weather => _weather;
  int? get clouds => _clouds;
  double? get pop => _pop;
  double? get rain => _rain;
  double? get uvi => _uvi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['moonrise'] = _moonrise;
    map['moonset'] = _moonset;
    map['moon_phase'] = _moonPhase;
    if (_temp != null) {
      map['temp'] = _temp?.toJson();
    }
    if (_feelsLike != null) {
      map['feels_like'] = _feelsLike?.toJson();
    }
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['dew_point'] = _dewPoint;
    map['wind_speed'] = _windSpeed;
    map['wind_deg'] = _windDeg;
    map['wind_gust'] = _windGust;
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['clouds'] = _clouds;
    map['pop'] = _pop;
    map['rain'] = _rain;
    map['uvi'] = _uvi;
    return map;
  }

}

/// id : 500
/// main : "Rain"
/// description : "light rain"
/// icon : "10d"

class Weather {
  Weather({
      int? id, 
      String? main, 
      String? description, 
      String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

/// day : 276.05
/// night : 273.85
/// eve : 274.76
/// morn : 277.71

class Feels_like {
  Feels_like({
      double? day, 
      double? night, 
      double? eve, 
      double? morn,}){
    _day = day;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  Feels_like.fromJson(dynamic json) {
    _day = json['day'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }
  double? _day;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}

/// day : 279.72
/// min : 278.25
/// max : 280.57
/// night : 278.42
/// eve : 278.84
/// morn : 278.91

class Temp {
  Temp({
      double? day, 
      double? min, 
      double? max, 
      double? night, 
      double? eve, 
      double? morn,}){
    _day = day;
    _min = min;
    _max = max;
    _night = night;
    _eve = eve;
    _morn = morn;
}

  Temp.fromJson(dynamic json) {
    _day = json['day'];
    _min = json['min'];
    _max = json['max'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }
  double? _day;
  double? _min;
  double? _max;
  double? _night;
  double? _eve;
  double? _morn;

  double? get day => _day;
  double? get min => _min;
  double? get max => _max;
  double? get night => _night;
  double? get eve => _eve;
  double? get morn => _morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['min'] = _min;
    map['max'] = _max;
    map['night'] = _night;
    map['eve'] = _eve;
    map['morn'] = _morn;
    return map;
  }

}