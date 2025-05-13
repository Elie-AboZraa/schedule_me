class StudentPref {
  final int _maxDays;
  final List<String> _preferredDays;
  final bool _avoidBackToBack;

  StudentPref({
    required int maxDays,
    required List<String> preferredDays,
    required bool avoidBackToBack,
  })  : _maxDays = maxDays,
        _preferredDays = preferredDays,
        _avoidBackToBack = avoidBackToBack;

  // Public getters
  int get maxDays => _maxDays;
  List<String> get preferredDays => _preferredDays;
  bool get avoidBackToBack => _avoidBackToBack;
}