class StudentPref {
  final int maxDays;
  final List<String> preferredDays;
  final bool avoidBackToBack;

  StudentPref({
    required this.maxDays,
    required this.preferredDays,
    required this.avoidBackToBack,
  });
}