import '../utils/logging.dart' show Logging;

class Program {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String duration;
  final String description;
  final String mode;
  final String level;
  final WrittenBy writtenBy;
  final Map<String, List<Exercise>> plan;
  final KeyConsiderations keyConsiderations;
  final double price; 

  Program({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.duration,
    required this.description,
    required this.mode,
    required this.level,
    required this.writtenBy,
    required this.plan,
    required this.keyConsiderations,
    required this.price, 
  });

  factory Program.fromJson(Map<dynamic, dynamic> json) {

    return Program(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String,
      mode: json['mode'] as String,
      level: json['level'] as String,
      writtenBy: WrittenBy.fromJson(json['writtenBy'] as Map<dynamic, dynamic>),
      plan: _parsePlan(json['plan']), 
      keyConsiderations: KeyConsiderations.fromJson(json['keyConsiderations'] as Map<dynamic, dynamic>),
      price: (json['price'] as num).toDouble(), 
    );
  }


  static Map<String, List<Exercise>> _parsePlan(dynamic rawPlan) {
    final Map<String, List<Exercise>> parsedPlan = {};
    if (rawPlan is Map<dynamic, dynamic>) {
      rawPlan.forEach((dayKey, exercisesList) {
        if (dayKey is String && exercisesList is List<dynamic>) {
          parsedPlan[dayKey] = exercisesList
              .map((e) => Exercise.fromJson(e as Map<dynamic, dynamic>))
              .toList();
        } else {
          Logging.log.w('Warning: Skipping invalid plan entry for day "$dayKey".');
        }
      });
    }
    return parsedPlan;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'duration': duration,
      'description': description,
      'mode': mode,
      'level': level,
      'writtenBy': writtenBy.toJson(),
      'plan': plan.map((day, exercises) => MapEntry(
            day,
            exercises.map((e) => e.toJson()).toList(),
          )),
      'keyConsiderations': keyConsiderations.toJson(),
      'price': price, 
    };
  }
}

class WrittenBy {
  final String name;
  final String expertise;
  final String imageUrl;

  WrittenBy({
    required this.name,
    required this.expertise,
    required this.imageUrl,
  });


  factory WrittenBy.fromJson(Map<dynamic, dynamic> json) {
    return WrittenBy(
      name: json['name'] as String,
      expertise: json['expertise'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'expertise': expertise,
      'imageUrl': imageUrl,
    };
  }
}

class Exercise {
  final String name;
  final dynamic sets; 
  final dynamic reps; 

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
  });


  factory Exercise.fromJson(Map<dynamic, dynamic> json) {
    return Exercise(
      name: json['name'] as String,
      sets: json['sets'], 
      reps: json['reps'], 
    );
  }

  // Converts Exercise to Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
    };
  }
}

class KeyConsiderations {
  final String? progressiveOverload;
  final String? nutrition;
  final String? restAndRecovery;
  final String? progression; 
  final String? mobility;     
  final String? consistency;

  KeyConsiderations({
    required this.progressiveOverload,
    required this.nutrition,
    required this.restAndRecovery,
    this.progression,
    this.mobility,
    this.consistency,
  });


  factory KeyConsiderations.fromJson(Map<dynamic, dynamic> json) {
    return KeyConsiderations(
      progressiveOverload: json['progressiveOverload'] as String?,
      nutrition: json['nutrition'] as String?,
      restAndRecovery: json['restAndRecovery'] as String?,
      progression: json['progression'] as String?,
      mobility: json['mobility'] as String?,
      consistency: json['consistency'] as String?,
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {
      'progressiveOverload': progressiveOverload,
      'nutrition': nutrition,
      'restAndRecovery': restAndRecovery,
    };
    if (progression != null) jsonMap['progression'] = progression;
    if (mobility != null) jsonMap['mobility'] = mobility;
    if (consistency != null) jsonMap['consistency'] = consistency;
    return jsonMap;
  }
}