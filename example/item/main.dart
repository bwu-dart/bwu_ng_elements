import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:bwu_ng_elements/icon.dart'
    show BwuIcon, BwuIconSetSvg, IconSetRegistry;
import 'package:bwu_ng_elements/item.dart' show BwuItem;

import 'package:angular2/core.dart' show Component, OnInit, provide;
import 'package:bwu_ng_elements/icons.dart'
    show
        BwuIcons;
import 'package:bwu_ng_elements/item/icon_item.dart';
///
void main() {
//  enableProdMode();
  bootstrap(AppElement, [
    ROUTER_PROVIDERS,
    provide(APP_BASE_HREF, useValue: '/'),
    IconSetRegistry
//    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}

/// Example root component
@Component(
    selector: 'app-element',
    directives: const [
      BwuIcon,
      BwuIcons,
      BwuItem,
      BwuIconItem
    ],
//styleUrls: const ['app_element.css'],
styles: const ['''
  .container {
    border: solid 1px red;
    width: 180px;
  }'''
],
    template: '''
<bwu-icons></bwu-icons>
<h1>BWU NG Elements Item Demo</h1>
<div class="container">
  <bwu-item>Item</bwu-item>
  <bwu-icon-item>
    <bwu-icon icon="inbox" item-icon></bwu-icon>
    Inbox
  </bwu-icon-item>
<div>
''')
class AppElement implements OnInit {
  IconSetRegistry _iconSets;

  List<String> iconSetNames;

  ///
  AppElement(this._iconSets);

  @override
  void ngOnInit() {
    iconSetNames = _iconSets.iconSets.keys.toList();
    _iconSets.iconSetAdded.listen((_) {
      iconSetNames = _iconSets.iconSets.keys.toList();
      print(iconSetNames);
    });
  }

  List<String> iconNames(String iconSet) =>
      _iconSets.iconSets[iconSet].iconNames;
}
