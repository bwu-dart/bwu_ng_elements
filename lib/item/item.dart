library bwu_ng_elements.item.item;

import 'package:angular2/core.dart' show Component, ViewEncapsulation;

/// An interactive list item. By default, it is a horizontal flexbox.
@Component(
    selector: 'bwu-item',
    styleUrls: const ['item.css'],
    template: '<ng-content></ng-content>',
    host: const {'tabindex': '0', 'role': 'option'}//,
//    encapsulation: ViewEncapsulation.Native
)
class BwuItem {}
