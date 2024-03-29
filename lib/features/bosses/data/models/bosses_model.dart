import 'dart:convert';

import 'package:elden_ring_cl/features/bosses/domain/entities/bosses.dart';

/// success : true
/// count : 30
/// total : 106
/// data : [{"id":"17f695abef9l0i1ujzrup5y0z7rw6","name":"Abductor Virgins","image":null,"region":"Mount Gelmir","description":"Deadly mechanical constructs who wield massive blades.","location":"Volcano Manor","drops":["10.000 Runes","Inquisitor's Girandole"],"healthPoints":"???"},{"id":"17f69b4ba0al0i1uk6s98t1nbtxunt","name":"Alecto, Black Knife Ringleader","image":"https://eldenring.fanapis.com/images/bosses/17f69b4ba0al0i1uk6s98t1nbtxunt.png","region":"Liurnia of the Lakes","description":"Remarkably agile and aggressive warrior. Dangerous even for those with shield coverage...","location":"Ringleader's Evergoal, Liurnia of the Lakes","drops":["8.000 Runes","Black Knife Tiche"],"healthPoints":"???"},{"id":"17f69d0313fl0i1uk8pokynv71bkz8","name":"Alecto Black Knife Ringleader","image":"https://eldenring.fanapis.com/images/bosses/17f69d0313fl0i1uk8pokynv71bkz8.png","region":"Liurnia of the Lakes","description":"Remarkably agile and aggressive warrior. Dangerous even for those with shield coverage...","location":"Limgrave","drops":["80.000 Runes","Other Drops"],"healthPoints":"???"},{"id":"17f69b85929l0i1ukc4l2up7yp9v0i","name":"Alabaster Lord","image":"https://eldenring.fanapis.com/images/bosses/17f69b85929l0i1ukc4l2up7yp9v0i.png","region":"Liurnia of the Lakes","description":"An Evergaol prisoner wielding a vicious sword and the void with murderous intent.","location":"Royal Grave Evergaol, Liurnia of the Lakes","drops":["3.600 Runes","Meteorite"],"healthPoints":"???"},{"id":"17f69a3ca37l0i1ukd1lq14ctafbk","name":"Adan, Thief Of Fire","image":"https://eldenring.fanapis.com/images/bosses/17f69a3ca37l0i1ukd1lq14ctafbk.png","region":"Liurnia of the Lakes","description":"An evergaol prisoner and former battle mage, Adan wields a spiked flail and uses stolen knowledge of fire magic to great effect.","location":"Malefactor's Evergaol","drops":["3.800 Runes","Flame of the Fell God"],"healthPoints":"2200"},{"id":"17f69a63610l0i1ukyx7xgx6vf0zoa","name":"Ancient Dragon Lansseax","image":"https://eldenring.fanapis.com/images/bosses/17f69a63610l0i1ukyx7xgx6vf0zoa.png","region":"Altus Plateau","description":"Lansseax was the sister of Fortissax. It is said that she took the from of a human to commune with the knights as a priestess of the ancient dragon cult.","location":"Altus Plateau","drops":["60.000 Runes","Lansseax's Glaive"],"healthPoints":"9087"},{"id":"17f69590896l0i1ul0hnmor8iyf9xd","name":"Ancestor Spirit","image":"https://eldenring.fanapis.com/images/bosses/17f69590896l0i1ul0hnmor8iyf9xd.png","region":"Limgrave","description":"A glowing spirit that takes the form of a large deer, making it a menacing threat when charging at targets.","location":"Siofra River","drops":["13.000 Runes","Ancestral Follower Ashes"],"healthPoints":"2200"},{"id":"17f69878c4al0i1ul0i7dsfou8igrk","name":"Ancient Hero Of Zamor","image":"https://eldenring.fanapis.com/images/bosses/17f69878c4al0i1ul0i7dsfou8igrk.png","region":"Weeping Peninsula","description":"Noticeably agile, frost-made creature suceptible to magic attacks.","location":"Weeping Evergaol, Giant-Conquering Hero's Grave","drops":["5,400 Runes","Radagon's Scarseal","83,000 Runes","Zamor Curved Sword","Zamor Mask","Zamor Armor","Zamor Bracelets","Zamor Legwraps"],"healthPoints":" 2200"},{"id":"17f697240ecl0i1ul21nevug9wq54e","name":"Beast Clergyman","image":"https://eldenring.fanapis.com/images/bosses/17f697240ecl0i1ul21nevug9wq54e.png","region":"Caelid","description":"Temporarily overtaken by their bestial rage, the Beast Clergyman attacks ferociously, throwing rocks and themselves at their foes. Calm their aggression and return them to their senses.","location":"Crumbling Farum Azula","drops":["N/A"],"healthPoints":"2200"},{"id":"17f69bcfd7dl0i1ul502rklvi8tx62","name":"Astel, Stars Of Darkness","image":"https://eldenring.fanapis.com/images/bosses/17f69bcfd7dl0i1ul502rklvi8tx62.png","region":"Consecrated Snowfield","description":"A hostile, massive Dragon-Fly creature. Menacing and extremely powerful.","location":"Yelough Anix Tunnel in Consecrated Snowfield","drops":["120000 Runes","Meteorite of Astel"],"healthPoints":"25,376"},{"id":"17f69d4387al0i1ulpqqumwqw05j3c","name":"Beast Of Farum Azula","image":"https://eldenring.fanapis.com/images/bosses/17f69d4387al0i1ulpqqumwqw05j3c.png","region":"Limgrave","description":"Underground-living creature found at Groveside Cave","location":"Groveside Cave","drops":["1000 Runes","Flamedrake Talisman"],"healthPoints":"1960"},{"id":"17f69d7fe72l0i1ultk418yedh25s7","name":"Beastman Of Farum Azula","image":"https://eldenring.fanapis.com/images/bosses/17f69d7fe72l0i1ultk418yedh25s7.png","region":"Dragonbarrow","description":"The beasts of Groveside Cave rally around the prowess of the Beastman of Farum Azula","location":"Groveside Cave, Dragonbarrow Cave","drops":["1000 Runes","Flamedrake Talisman","65,000 Runes","Flamedrake Talisman +2"],"healthPoints":"1,960"},{"id":"17f69c4aacel0i1uluegh15idblimv","name":"Bell Bearing Hunter","image":"https://eldenring.fanapis.com/images/bosses/17f69c4aacel0i1uluegh15idblimv.png","region":"Dragonbarrow","description":"Menacing and slow-paced, it wields a large, red-glowing sword and a shield combined with a full body armor and a chilling cape.","location":"Warmaster's Shack, Northern Stormhill, Church of Vows, East Liurnia, Hermit Merchant's Shack, Leyndell Royal Captial, Dragonbarrow, North Caelid","drops":["2700 Runes","Bone Peddler's Bell Bearing"],"healthPoints":"6000 Runes, Meat Peddler's Bell Bearing"},{"id":"17f69a61779l0i1ulv0a3ru8iy0zh5","name":"Black Blade Kindred","image":"https://eldenring.fanapis.com/images/bosses/17f69a61779l0i1ulv0a3ru8iy0zh5.png","region":"Dragonbarrow","description":"Imposing Gargoyle wielding a massive armament","location":"Caelid, Forbidden Lands","drops":["88,000 Runes","Gargoyle's Blackblade","Gargoyle's Black Halberd","60,000 Runes","Gargoyle's Black Axe","Gargoyle's Black Blades"],"healthPoints":"12,500"},{"id":"17f69bd3c06l0i1ulx2jxbiogta1i","name":"Black Knife Assassin","image":"https://eldenring.fanapis.com/images/bosses/17f69bd3c06l0i1ulx2jxbiogta1i.png","region":"Limgrave","description":"Relentless and agile dark figures carrying a ","location":"Deathtouched Catacombs, Black Knife CatacombsSage's Cave","drops":["1,600 Runes","Assassin's Crimson Dagger","1, 600 Runes","Assassin's Cerulean Dagger","Sage's Cave","?? Runes","Concealing Veil","11,339 Runes","Black Knife"],"healthPoints":"2750"},{"id":"17f69637e92l0i1um8wqsflgk3i9yr","name":"Bloodhound Knight Darriwil","image":"https://eldenring.fanapis.com/images/bosses/17f69637e92l0i1um8wqsflgk3i9yr.png","region":"Limgrave","description":"The merciless bloodhounds attack with grace and agility, never backing down or giving a moment's rest.","location":"Limgrave, Forlon Hound Evergaol","drops":["1900 Runes","Bloodhound's Fang"],"healthPoints":"14,792"},{"id":"17f697f48d5l0i1umdbu7v5phffgq","name":"Burial Tree Watchdog","image":"https://eldenring.fanapis.com/images/bosses/17f697f48d5l0i1umdbu7v5phffgq.png","region":"Limgrave","description":"A large feline-hound looking guardian that serves as a \"Watchdog\"for the Burial Tree of the Stormfoot Catacombs.","location":"Limgrave, Stormfoot Catacombs","drops":["800 Runes","Ash of War: Glintsword Arch"],"healthPoints":"???"},{"id":"17f69563d15l0i1umhb4am3xzuib3g","name":"Cleanrot Knight","image":"https://eldenring.fanapis.com/images/bosses/17f69563d15l0i1umhb4am3xzuib3g.png","region":"Liurnia of the Lakes","description":"Powerful, dexterous Knight capable of distanced, very rapid attacks. Its spear and sword are a threat to any light-armored fighter.","location":"Stillwater Cave, Liurnia of the Lakes","drops":["3,300 Runes","Winged Sword Insignia","Cleanrot Knight's Sword"],"healthPoints":"???"},{"id":"17f69d6ca41l0i1umlxg0j36mhrnzr","name":"Borealis The Freezing Fog","image":"https://eldenring.fanapis.com/images/bosses/17f69d6ca41l0i1umlxg0j36mhrnzr.png","region":"Mountaintops of the Giants","description":"Frost Dragon guarding the frozen lake of Mountaintop of Giants, emits a permanent blizzard.","location":"Mountaintops of the Giants","drops":["100,000 Runes","Dragon Heart"],"healthPoints":"11,100"},{"id":"17f698b7d2fl0i1umtkf7cu5a21hdw","name":"Commander Niall","image":"https://eldenring.fanapis.com/images/bosses/17f698b7d2fl0i1umtkf7cu5a21hdw.png","region":"Mountaintop of the Giants","description":"Commander Niall is a tall and built knight with a peg leg, clad in heavy armor, wielding a halberd that doubles as a battle standard. He is accompanied by two Spectral Banished Knights, one equipped with dual swords and the other equipped with a sword and shield.","location":"Mountaintops of the Giants","drops":["90000 Runes","Veteran's Prosthesis"],"healthPoints":"16,000"},{"id":"17f69562d87l0i1umxu2qwle86ai8q","name":"Commander O'neil","image":null,"region":"Caelid","description":"A large and imposing human commander who wields a halberd that doubles as a battle standard, rousing his spirit minions to battle with unquenchable fervor.","location":"Caelid","drops":["12,000 Runes","Commander's Standard","Unalloyed Gold Needle"],"healthPoints":"11,400"},{"id":"17f699b0755l0i1un48m87fngquaw","name":"Crucible Knight Ordovis","image":"https://eldenring.fanapis.com/images/bosses/17f699b0755l0i1un48m87fngquaw.png","region":"Altus Plateau","description":"Large, heavy and fully armored. With the ability to materialize fiery wings and attack from above. Attacks with the huge power of Ordivis's Greatsword and a Greatshield. Slow, but extremely tough and highly dangerous.","location":"Auriza Hero's Grave","drops":["28000 Runes","Ordovis's Greatsword","Crucible Axe Helm","Crucible Axe Armor","Crucible Gauntlets","Crucible Greaves"],"healthPoints":"???"},{"id":"17f695b37c1l0i1ungf7vjojqaf4zp","name":"Crystalians","image":"https://eldenring.fanapis.com/images/bosses/17f695b37c1l0i1ungf7vjojqaf4zp.png","region":"Altus Plateau","description":"Crystal energy in the form of a human with devastating power.","location":"Academy Crystal Cave, Altus Tunnel","drops":["3300 Runes","Crystal Release","1800 Runes","Somberstone Miner's Bell Bearing (2)","3000 Runes","Smithing-Stone Miner's Bell Bearing (1)","7000 Runes","Crystal Torrent"],"healthPoints":"???"},{"id":"17f69e151d8l0i1uo19hl8r6l0snmo","name":"Deathbird","image":"https://eldenring.fanapis.com/images/bosses/17f69e151d8l0i1uo19hl8r6l0snmo.png","region":"Limgrave","description":"A bipedal bird with arms and a bird skull for a head and is found in various locations","location":"Limgrave, Weeping Peninsula, Liurnia of the Lakes","drops":["3,900 Runes","Blue-Feathered Branchsword","Sacrifical Axe","Red-Feathered Branchsword"],"healthPoints":"2750"},{"id":"17f69bcc1cdl0i1uoai2hm5tcbuhh2","name":"Decaying Ekzykes","image":"https://eldenring.fanapis.com/images/bosses/17f69bcc1cdl0i1uoai2hm5tcbuhh2.png","region":"Caelid","description":"A pale white dragon — its scales blighted by the same scarlet rot that plagues the region of Caelid. It silently waits along the southern highway, awaiting unsuspecting travelers to fall prey to its deathly onslaught.","location":"Caelid","drops":["38,000 Runes","Dragon Heart"],"healthPoints":"23,731"},{"id":"17f6961da46l0i1uoh7hemoben3dtg","name":"Demi-human Chief","image":"https://eldenring.fanapis.com/images/bosses/17f6961da46l0i1uoh7hemoben3dtg.png","region":"Limgrave","description":"The darkness of Coastal Cave hides a den of those who may look almost human, but are certainly not.","location":"Coastal Cave","drops":["900 Runes","Tailoring Tools","Sewing Needle"],"healthPoints":"???"},{"id":"17f69559137l0i1uoqf3qzndh0901t","name":"Demi-human Queen Maggie","image":null,"region":"Mount Gelmir","description":"Sovereign Demi-Human creature roaming the lands of Mt. Gelmir","location":"Mt. Gelmir","drops":["13000 Runes","Memory Stone","Golden Rune [1]"],"healthPoints":"???"},{"id":"17f69518792l0i1up7fr7vzvqcmzf","name":"Divine Bridge Golem","image":"https://eldenring.fanapis.com/images/bosses/17f69518792l0i1up7fr7vzvqcmzf.png","region":"Altus Plateau","description":"Enormously large and lethargic Golem that slowly storms into battle when it becomes aware of your presence.","location":"Lyendell, Royal Capital","drops":["2992 Runes"],"healthPoints":"???"},{"id":"17f69b39c43l0i1up7iq7q4lvvgyc","name":"Demi-human Queen Margot","image":null,"region":"Mount Gelmir","description":"Sovereign Demi-Human creature concealed within isolated caves.","location":"Mt. Gelmir","drops":["11,000 Runes","Jar Cannon"],"healthPoints":"???"},{"id":"17f69625d6el0i1upqw478c5kvsjv3","name":"Draconic Tree Sentinel","image":"https://eldenring.fanapis.com/images/bosses/17f69625d6el0i1upqw478c5kvsjv3.png","region":"Altus Plateau","description":"Massive knight clad in golden armor atop a giant horse.","location":"Capital Outskirts Crumbling Farum Azula","drops":["50,000 Runes","Dragon Greatclaw","Dragonclaw Shield"],"healthPoints":"8,398"}]

BossesModel bossesModelFromJson(String str) =>
    BossesModel.fromJson(json.decode(str));
String bossesModelToJson(BossesModel data) => json.encode(data.toJson());

class BossesModel {
  BossesModel({
    bool? success,
    num? count,
    num? total,
    List<Data>? data,
  }) {
    _success = success;
    _count = count;
    _total = total;
    _data = data;
  }

  BossesModel.fromJson(dynamic json) {
    _success = json['success'];
    _count = json['count'];
    _total = json['total'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  num? _count;
  num? _total;
  List<Data>? _data;
  BossesModel copyWith({
    bool? success,
    num? count,
    num? total,
    List<Data>? data,
  }) =>
      BossesModel(
        success: success ?? _success,
        count: count ?? _count,
        total: total ?? _total,
        data: data ?? _data,
      );
  bool? get success => _success;
  num? get count => _count;
  num? get total => _total;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['count'] = _count;
    map['total'] = _total;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "17f695abef9l0i1ujzrup5y0z7rw6"
/// name : "Abductor Virgins"
/// image : null
/// region : "Mount Gelmir"
/// description : "Deadly mechanical constructs who wield massive blades."
/// location : "Volcano Manor"
/// drops : ["10.000 Runes","Inquisitor's Girandole"]
/// healthPoints : "???"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? name,
    dynamic image,
    String? region,
    String? description,
    String? location,
    List<String>? drops,
    String? healthPoints,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _region = region;
    _description = description;
    _location = location;
    _drops = drops;
    _healthPoints = healthPoints;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _region = json['region'];
    _description = json['description'];
    _location = json['location'];
    _drops = json['drops'] != null ? json['drops'].cast<String>() : [];
    _healthPoints = json['healthPoints'];
  }
  String? _id;
  String? _name;
  dynamic _image;
  String? _region;
  String? _description;
  String? _location;
  List<String>? _drops;
  String? _healthPoints;
  Data copyWith({
    String? id,
    String? name,
    dynamic image,
    String? region,
    String? description,
    String? location,
    List<String>? drops,
    String? healthPoints,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        region: region ?? _region,
        description: description ?? _description,
        location: location ?? _location,
        drops: drops ?? _drops,
        healthPoints: healthPoints ?? _healthPoints,
      );
  String? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get region => _region;
  String? get description => _description;
  String? get location => _location;
  List<String>? get drops => _drops;
  String? get healthPoints => _healthPoints;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['region'] = _region;
    map['description'] = _description;
    map['location'] = _location;
    map['drops'] = _drops;
    map['healthPoints'] = _healthPoints;
    return map;
  }
}
