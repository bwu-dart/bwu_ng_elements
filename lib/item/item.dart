library bwu_ng_elements.item.item;

import 'package:angular2/core.dart' show Component, Input;

/// An interactive list item. By default, it is a horizontal flexBox.
@Component(
    selector: 'bwu-item',
    styleUrls: const ['item.css'],
    template: '<ng-content></ng-content>',
    host: const {
      'tabindex': '0',
      'role': 'option',
      '[class.bwu-active]': 'isActive'
    } //,
//    encapsulation: ViewEncapsulation.Native
    )
class BwuItem {
  /// Whether the item is in active state.
  @Input()
  bool isActive = false;

  /// Arbitrary data that can be passed in.
  @Input()
  dynamic data;
}
