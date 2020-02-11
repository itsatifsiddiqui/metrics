import 'package:equatable/equatable.dart';
import 'package:guardian/slack/model/slack_text_object.dart';

/// A class representing Section Block element
/// (https://api.slack.com/reference/block-kit/blocks#section)
class SlackSectionBlock extends Equatable {
  /// The text for the block, in the form of a [SlackTextObject].
  ///
  /// Maximum length for the text in this field is 3000 characters.
  final SlackTextObject text;

  /// An array of text objects. Any text objects included with fields will be
  /// rendered in a compact format that allows for 2 columns of side-by-side
  /// text.
  ///
  /// Maximum number of items is 10. Maximum length for the
  /// [SlackTextObject.text] in each item is 2000 characters.
  final List<SlackTextObject> fields;

  /// Creates an instance of Slack section block.
  ///
  /// Either [text] or [fields] is required, however can be provided
  /// simultaneously.
  const SlackSectionBlock({
    this.text,
    this.fields,
  });

  @override
  List<Object> get props => [text, fields];

  /// Converts object into the [Map].
  ///
  /// Resulting map will include only non-null fields of an object it
  /// represents. Result is valid to be sent to Slack API.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{'type': 'section'};

    if (text != null) map['text'] = text.toJson();
    if (fields != null && fields.isNotEmpty) {
      map['fields'] = fields.map((field) => field.toJson()).toList();
    }

    return map;
  }

  @override
  String toString() {
    return '$runtimeType ${toJson()}';
  }
}