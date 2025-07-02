class JournalFilterParams {
  final DateTime? journalDate;
  final String? entryMode;
  final bool clearAllFilter;

  JournalFilterParams(
      {this.journalDate, this.entryMode, this.clearAllFilter = false});
}
