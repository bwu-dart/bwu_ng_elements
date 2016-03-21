library bwu_ng_elements.item.icon_item;

import 'package:angular2/core.dart' show Component, ViewEncapsulation;
import 'package:bwu_ng_elements/item.dart';

/// An interactive list item. By default, it is a horizontal flexBox.
/// Content that has the attribute `item-icon` is projected to the left.
@Component(
    selector: 'bwu-icon-item',
    styleUrls: const ['icon_item.css'],
    template: '''
<div id="contentIcon" class="content-icon">
  <ng-content select="[item-icon]"></ng-content>
</div>
<ng-content></ng-content>
''',
    inputs: const ['isActive', 'data'],
    host: const {
      'tabindex': '0',
      'role': 'option',
      '[class.bwu-active]': 'isActive'
    },
    encapsulation: ViewEncapsulation.Native
)
class BwuIconItem extends BwuItem {}
