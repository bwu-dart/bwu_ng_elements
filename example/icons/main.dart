import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:bwu_ng_elements/icon.dart'
    show BwuIcon, BwuIconSetSvg, IconSetRegistry;
import 'package:angular2/core.dart' show Component, OnInit, provide;
import 'package:bwu_ng_elements/icons.dart'
    show
        BwuAvIcons,
        BwuCommunicationIcons,
        BwuDeviceIcons,
        BwuEditorIcons,
        BwuHardwareIcons,
        BwuIcons,
        BwuImageIcons,
        BwuMapsIcons,
        BwuNotificationIcons,
        BwuPlacesIcons,
        BwuSocialIcons;

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

/// The root component
@Component(
    selector: 'app-element',
    directives: const [
      BwuIcon,
      BwuIcons,
      BwuAvIcons,
      BwuCommunicationIcons,
      BwuDeviceIcons,
      BwuEditorIcons,
      BwuHardwareIcons,
      BwuImageIcons,
      BwuMapsIcons,
      BwuNotificationIcons,
      BwuPlacesIcons,
      BwuSocialIcons
    ],
    styleUrls: const ['app_element.css'],
    template: '''
<h1>BWU NG Elements Icons Demo</h1>
<bwu-icons></bwu-icons>
<bwu-av-icons></bwu-av-icons>
<bwu-communication-icons></bwu-communication-icons>
<bwu-device-icons></bwu-device-icons>
<bwu-editor-icons></bwu-editor-icons>
<bwu-hardware-icons></bwu-hardware-icons>
<bwu-image-icons></bwu-image-icons>
<bwu-maps-icons></bwu-maps-icons>
<bwu-notification-icons></bwu-notification-icons>
<bwu-places-icons></bwu-places-icons>
<bwu-social-icons></bwu-social-icons>

<template ngFor #iconSet [ngForOf]="iconSetNames" >
  <h2>{{iconSet}}</h2>
  <div class="set">
    <span *ngFor="#icon of iconNames(iconSet)" class="container">
      <bwu-icon [icon]="icon"></bwu-icon>
      <div class="icon-title">{{icon}}</div>
    </span>
  </div>
</template>
''')
class AppElement implements OnInit {
  IconSetRegistry _iconSets;

  /// The list of names of the register icon sets.
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

  /// Returns a list of names of all icons contained in the [iconSet].
  List<String> iconNames(String iconSet) =>
      _iconSets.iconSets[iconSet].iconNames;
}
