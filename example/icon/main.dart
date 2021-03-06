import 'package:angular2/angular2.dart' show provide;
import 'package:angular2/core.dart' show Component;
import 'package:angular2/platform/common.dart' show APP_BASE_HREF;
import 'package:angular2/platform/browser.dart' show bootstrap;
import 'package:angular2/router.dart' show ROUTER_PROVIDERS;
import 'package:bwu_ng_elements/icon.dart' show BwuIcon, IconSetRegistry;
import 'package:bwu_ng_elements/icons.dart' show BwuIcons;

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

/// The root component.
@Component(
    selector: 'app-element',
    directives: const [BwuIcons, BwuIcon],
    template: '''
<h1>BWU NG Icon</h1>
<bwu-icons></bwu-icons>
<bwu-icon width="50px" icon="accessibility" style="stroke: red; color: blue; fill: green;"></bwu-icon>
''')
class AppElement {}
