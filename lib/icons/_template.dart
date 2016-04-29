/// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
/// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
/// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
/// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
/// Code distributed by Google as part of the polymer project is also
/// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

library bwu_ng_elements.icons.communication;

import 'package:angular2/core.dart' show Component;
import 'package:bwu_ng_elements/icon.dart' show BwuIconSetSvg;

/// The communications icons from the Material Design icons
@Component(
    selector: 'bwu-communications-icons',
    directives: const [BwuIconSetSvg],
    host: const {'[style.display]': '"none !important"'},
    template: '''
<bwu-iconset-svg name="_default_" >
<svg><defs>

</defs></svg>
</bwu-iconset-svg>
''')
class BwuCommunicationsIcons {}
