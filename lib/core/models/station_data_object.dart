import 'package:free_radio_philippines/core/models/station_object.dart';

class StationDataObject {
  StationDataObject({
    required this.data,
    required this.youMayLike,
    required this.buttonsName,
    required this.labelsName,
    required this.labelsSchedule,
  });

  late final Data data;
  late final List<StationObject> youMayLike;
  late final ButtonsName buttonsName;
  late final LabelsName labelsName;
  late final LabelsSchedule labelsSchedule;

  StationDataObject.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    youMayLike = List.from(json['youMayLike'])
        .map((e) => StationObject.fromJson(e))
        .toList();
    buttonsName = ButtonsName.fromJson(json['buttonsName']);
    labelsName = LabelsName.fromJson(json['labelsName']);
    labelsSchedule = LabelsSchedule.fromJson(json['labelsSchedule']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['youMayLike'] = youMayLike.map((e) => e.toJson()).toList();
    _data['buttonsName'] = buttonsName.toJson();
    _data['labelsName'] = labelsName.toJson();
    _data['labelsSchedule'] = labelsSchedule.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.slug,
    required this.crumbs,
    required this.url,
    required this.title,
    required this.desc,
    required this.h1,
    required this.h1After,
    required this.countryString,
    required this.introtextFrequencies,
    required this.introtext,
    required this.rating,
    required this.streams,
    required this.contacts,
    required this.socialites,
    required this.template,
    required this.starRatingAverage,
    required this.starRatingCount,
    required this.like,
    required this.image,
    required this.genres,
    required this.formats,
    required this.languages,
    required this.brothers,
    required this.locals,
    required this.people,
    required this.city,
    required this.comments,
    required this.podcasts,
    required this.callSign,
    required this.menutitle,
    required this.menutitle_2,
    required this.frequency,
    required this.area,
    required this.date,
    required this.wiki,
  });

  late final int id;
  late final String name;
  late final String slug;
  late final List<Crumbs> crumbs;
  late final String url;
  late final String title;
  late final String desc;
  late final String h1;
  late final String h1After;
  late final String countryString;
  late final String introtextFrequencies;
  late final String introtext;
  late final int rating;
  late final List<Streams> streams;
  late final List<Contacts> contacts;
  late final List<Socialites> socialites;
  late final String template;
  late final String starRatingAverage;
  late final int starRatingCount;
  late final int like;
  late final String image;
  late final List<Genres> genres;
  late final List<Formats> formats;
  late final List<dynamic> languages;
  late final List<dynamic> brothers;
  late final List<dynamic> locals;
  late final List<dynamic> people;
  late final City city;
  late final List<Comments> comments;
  late final List<dynamic> podcasts;
  late final String callSign;
  late final String menutitle;
  late final String menutitle_2;
  late final String? frequency;
  late final String area;
  late final String date;
  late final String wiki;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    crumbs = List.from(json['crumbs']).map((e) => Crumbs.fromJson(e)).toList();
    url = json['url'];
    title = json['title'];
    desc = json['desc'];
    h1 = json['h1'];
    h1After = json['h1_after'];
    countryString = json['country_string'];
    introtextFrequencies = json['introtext_frequencies'];
    introtext = json['introtext'];
    rating = json['rating'];
    streams =
        List.from(json['streams']).map((e) => Streams.fromJson(e)).toList();
    contacts =
        List.from(json['contacts']).map((e) => Contacts.fromJson(e)).toList();
    socialites = List.from(json['socialites'])
        .map((e) => Socialites.fromJson(e))
        .toList();
    template = json['template'];
    starRatingAverage = json['star_rating_average'];
    starRatingCount = json['star_rating_count'];
    like = json['like'];
    image = json['image'];
    genres = List.from(json['genres']).map((e) => Genres.fromJson(e)).toList();
    formats =
        List.from(json['formats']).map((e) => Formats.fromJson(e)).toList();
    languages = List.castFrom<dynamic, dynamic>(json['languages']);
    brothers = List.castFrom<dynamic, dynamic>(json['brothers']);
    locals = List.castFrom<dynamic, dynamic>(json['locals']);
    people = List.castFrom<dynamic, dynamic>(json['people']);
    city = City.fromJson(json['city']);
    comments =
        List.from(json['comments']).map((e) => Comments.fromJson(e)).toList();
    podcasts = List.castFrom<dynamic, dynamic>(json['podcasts']);
    callSign = json['call_sign'];
    menutitle = json['menutitle'];
    menutitle_2 = json['menutitle_2'];
    frequency = json['frequency'];
    area = json['area'];
    date = json['date'];
    wiki = json['wiki'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['crumbs'] = crumbs.map((e) => e.toJson()).toList();
    _data['url'] = url;
    _data['title'] = title;
    _data['desc'] = desc;
    _data['h1'] = h1;
    _data['h1_after'] = h1After;
    _data['country_string'] = countryString;
    _data['introtext_frequencies'] = introtextFrequencies;
    _data['introtext'] = introtext;
    _data['rating'] = rating;
    _data['streams'] = streams.map((e) => e.toJson()).toList();
    _data['contacts'] = contacts.map((e) => e.toJson()).toList();
    _data['socialites'] = socialites.map((e) => e.toJson()).toList();
    _data['template'] = template;
    _data['star_rating_average'] = starRatingAverage;
    _data['star_rating_count'] = starRatingCount;
    _data['like'] = like;
    _data['image'] = image;
    _data['genres'] = genres.map((e) => e.toJson()).toList();
    _data['formats'] = formats.map((e) => e.toJson()).toList();
    _data['languages'] = languages;
    _data['brothers'] = brothers;
    _data['locals'] = locals;
    _data['people'] = people;
    _data['city'] = city.toJson();
    _data['comments'] = comments.map((e) => e.toJson()).toList();
    _data['podcasts'] = podcasts;
    _data['call_sign'] = callSign;
    _data['menutitle'] = menutitle;
    _data['menutitle_2'] = menutitle_2;
    _data['frequency'] = frequency;
    _data['area'] = area;
    _data['date'] = date;
    _data['wiki'] = wiki;

    return _data;
  }
}

class Crumbs {
  Crumbs({
    required this.url,
    required this.name,
  });

  late final String url;
  late final String name;

  Crumbs.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['name'] = name;
    return _data;
  }
}

class Streams {
  Streams({
    required this.id,
    required this.name,
    required this.url,
  });

  late final String id;
  late final String name;
  late final String url;

  Streams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Contacts {
  Contacts({
    required this.id,
    required this.name,
    required this.url,
  });

  late final String id;
  late final String name;
  late final String url;

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Socialites {
  Socialites({
    required this.id,
    required this.name,
    required this.url,
  });

  late final String id;
  late final String name;
  late final String url;

  Socialites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Genres {
  Genres({
    required this.name,
    required this.url,
  });

  late final String name;
  late final String url;

  Genres.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class Formats {
  Formats({
    required this.name,
    required this.url,
  });

  late final String name;
  late final String url;

  Formats.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.title,
    required this.desc,
    required this.h1,
    required this.template,
    required this.url,
    required this.displayRadiosType,
  });

  late final int id;
  late final String name;
  late final String title;
  late final String desc;
  late final String h1;
  late final String template;
  late final String url;
  late final int displayRadiosType;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    desc = json['desc'];
    h1 = json['h1'];
    template = json['template'];
    url = json['url'];
    displayRadiosType = json['display_radios_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['desc'] = desc;
    _data['h1'] = h1;
    _data['template'] = template;
    _data['url'] = url;
    _data['display_radios_type'] = displayRadiosType;
    return _data;
  }
}

class Comments {
  Comments({
    required this.id,
    required this.rating,
    required this.name,
    required this.body,
    required this.createdAt,
    required this.comments,
  });

  late final int id;
  late final int rating;
  late final String name;
  late final String body;
  late final String createdAt;
  late final List<dynamic> comments;

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    name = json['name'];
    body = json['body'];
    createdAt = json['created_at'];
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['rating'] = rating;
    _data['name'] = name;
    _data['body'] = body;
    _data['created_at'] = createdAt;
    _data['comments'] = comments;
    return _data;
  }
}

class Children {
  Children({
    required this.name,
    required this.frequency,
    required this.url,
    required this.image,
    required this.city,
  });

  late final String name;
  late final String frequency;
  late final String url;
  late final String image;
  late final City city;

  Children.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    frequency = json['frequency'];
    url = json['url'];
    image = json['image'];
    city = City.fromJson(json['city']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['frequency'] = frequency;
    _data['url'] = url;
    _data['image'] = image;
    _data['city'] = city.toJson();
    return _data;
  }
}

class YouMayLike {
  YouMayLike({
    required this.name,
    required this.url,
    required this.image,
  });

  late final String name;
  late final String url;
  late final String image;

  YouMayLike.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    _data['image'] = image;
    return _data;
  }
}

class Titles {
  Titles({
    required this.frequency,
    required this.slogan,
    required this.genre,
    required this.relatedStations,
    required this.localStations,
    required this.whatSongsWerePlayed,
    required this.topSongs,
    required this.programs,
    required this.schedule,
    required this.people,
    required this.cities,
    required this.contactTitle,
    required this.youMayLike,
    required this.bitrate,
    required this.owner,
    required this.callSign,
    required this.date,
    required this.comments,
    required this.areas,
    required this.podcasts,
    required this.languages,
    required this.country,
    required this.format,
    required this.nowPlaying,
    required this.introtext,
  });

  late final String frequency;
  late final String slogan;
  late final String genre;
  late final String relatedStations;
  late final String localStations;
  late final String whatSongsWerePlayed;
  late final String topSongs;
  late final String programs;
  late final String schedule;
  late final String people;
  late final String cities;
  late final String contactTitle;
  late final String youMayLike;
  late final String bitrate;
  late final String owner;
  late final String callSign;
  late final String date;
  late final String comments;
  late final String areas;
  late final String podcasts;
  late final String languages;
  late final String country;
  late final String format;
  late final String nowPlaying;
  late final String introtext;

  Titles.fromJson(Map<String, dynamic> json) {
    frequency = json['frequency'];
    slogan = json['slogan'];
    genre = json['genre'];
    relatedStations = json['relatedStations'];
    localStations = json['localStations'];
    whatSongsWerePlayed = json['whatSongsWerePlayed'];
    topSongs = json['topSongs'];
    programs = json['programs'];
    schedule = json['schedule'];
    people = json['people'];
    cities = json['cities'];
    contactTitle = json['contactTitle'];
    youMayLike = json['youMayLike'];
    bitrate = json['bitrate'];
    owner = json['owner'];
    callSign = json['callSign'];
    date = json['date'];
    comments = json['comments'];
    areas = json['areas'];
    podcasts = json['podcasts'];
    languages = json['languages'];
    country = json['country'];
    format = json['format'];
    nowPlaying = json['nowPlaying'];
    introtext = json['introtext'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['frequency'] = frequency;
    _data['slogan'] = slogan;
    _data['genre'] = genre;
    _data['relatedStations'] = relatedStations;
    _data['localStations'] = localStations;
    _data['whatSongsWerePlayed'] = whatSongsWerePlayed;
    _data['topSongs'] = topSongs;
    _data['programs'] = programs;
    _data['schedule'] = schedule;
    _data['people'] = people;
    _data['cities'] = cities;
    _data['contactTitle'] = contactTitle;
    _data['youMayLike'] = youMayLike;
    _data['bitrate'] = bitrate;
    _data['owner'] = owner;
    _data['callSign'] = callSign;
    _data['date'] = date;
    _data['comments'] = comments;
    _data['areas'] = areas;
    _data['podcasts'] = podcasts;
    _data['languages'] = languages;
    _data['country'] = country;
    _data['format'] = format;
    _data['nowPlaying'] = nowPlaying;
    _data['introtext'] = introtext;
    return _data;
  }
}

class ButtonsName {
  ButtonsName({
    required this.moreChildren,
    required this.morePlaylists,
    required this.youMayLike,
    required this.relatedStations,
    required this.createComment,
    required this.addComments,
    required this.send,
    required this.moreRadios,
  });

  late final String moreChildren;
  late final String morePlaylists;
  late final String youMayLike;
  late final String relatedStations;
  late final String createComment;
  late final String addComments;
  late final String send;
  late final String moreRadios;

  ButtonsName.fromJson(Map<String, dynamic> json) {
    moreChildren = json['moreChildren'];
    morePlaylists = json['morePlaylists'];
    youMayLike = json['youMayLike'];
    relatedStations = json['relatedStations'];
    createComment = json['createComment'];
    addComments = json['addComments'];
    send = json['send'];
    moreRadios = json['moreRadios'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['moreChildren'] = moreChildren;
    _data['morePlaylists'] = morePlaylists;
    _data['youMayLike'] = youMayLike;
    _data['relatedStations'] = relatedStations;
    _data['createComment'] = createComment;
    _data['addComments'] = addComments;
    _data['send'] = send;
    _data['moreRadios'] = moreRadios;
    return _data;
  }
}

class LabelsName {
  LabelsName({
    required this.commentsName,
    required this.commentsMessage,
    required this.radioLikeDislike,
    required this.email,
  });

  late final String commentsName;
  late final String commentsMessage;
  late final String radioLikeDislike;
  late final String email;

  LabelsName.fromJson(Map<String, dynamic> json) {
    commentsName = json['commentsName'];
    commentsMessage = json['commentsMessage'];
    radioLikeDislike = json['radioLikeDislike'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['commentsName'] = commentsName;
    _data['commentsMessage'] = commentsMessage;
    _data['radioLikeDislike'] = radioLikeDislike;
    _data['email'] = email;
    return _data;
  }
}

class LabelsSchedule {
  LabelsSchedule({
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.sun,
    required this.monFri,
    required this.satSun,
    required this.time,
    required this.name,
    required this.onAir,
  });

  late final String mon;
  late final String tue;
  late final String wed;
  late final String thu;
  late final String fri;
  late final String sat;
  late final String sun;
  late final String monFri;
  late final String satSun;
  late final String time;
  late final String name;
  late final String onAir;

  LabelsSchedule.fromJson(Map<String, dynamic> json) {
    mon = json['mon'];
    tue = json['tue'];
    wed = json['wed'];
    thu = json['thu'];
    fri = json['fri'];
    sat = json['sat'];
    sun = json['sun'];
    monFri = json['monFri'];
    satSun = json['satSun'];
    time = json['time'];
    name = json['name'];
    onAir = json['onAir'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mon'] = mon;
    _data['tue'] = tue;
    _data['wed'] = wed;
    _data['thu'] = thu;
    _data['fri'] = fri;
    _data['sat'] = sat;
    _data['sun'] = sun;
    _data['monFri'] = monFri;
    _data['satSun'] = satSun;
    _data['time'] = time;
    _data['name'] = name;
    _data['onAir'] = onAir;
    return _data;
  }
}
