// Rule 实体类
class Rule {
  List<String> keywords;
  String ttsContent;
  int priority;
  bool matchAll;
  String regex;

  Rule({
    required this.keywords,
    required this.ttsContent,
    required this.priority,
    required this.matchAll,
    required this.regex,
  });

  Map<String, dynamic> toJson() {
    return {
      'keywords': keywords,
      'tts_content': ttsContent,
      'priority': priority,
      'match_all': matchAll,
      'regex': regex,
    };
  }

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      keywords: List<String>.from(json['keywords']),
      ttsContent: json['tts_content'],
      priority: json['priority'],
      matchAll: json['match_all'],
      regex: json['regex'],
    );
  }
}

List<Rule> moniRules = [
  Rule(
    regex: "验票失败.*上次验票时间.*",
    ttsContent: "已验票",
    priority: 15,
    keywords: [],
    matchAll: false,
  ),
  Rule(
    keywords: ["年卡"],
    ttsContent: "{ticket_name}请通行",
    priority: 12,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["员工卡"],
    ttsContent: "{ticket_name}请通过",
    priority: 11,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["单人票"],
    ttsContent: "验票通过请同行，票号 {ticket_no}",
    priority: 10,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["天气", "weather"],
    ttsContent: "今天天气晴朗，适合出门。",
    priority: 9,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["时间", "time"],
    ttsContent: "现在是北京时间 {current_time}",
    priority: 5,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["票号"],
    ttsContent: "您的票号是 {ticket_no}",
    priority: 8,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["票形"],
    ttsContent: "票形是 {ticket_type}",
    priority: 7,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["出行日期"],
    ttsContent: "您的出行日期是 {travel_date}",
    priority: 6,
    matchAll: false,
    regex: "",
  ),
  Rule(
    keywords: ["紧急", "emergency"],
    ttsContent: "请注意，这是一条紧急播报！",
    priority: 20,
    matchAll: false,
    regex: "^紧急.*\$",
  ),
];