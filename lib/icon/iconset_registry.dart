library bwu_ng_elements.icon.iconset_registry;

import 'package:angular2/core.dart' show Injectable;
import 'package:bwu_ng_elements/icon/iconset_svg.dart' show BwuIconSetSvg;
import 'dart:async' show Stream, StreamController;
import 'dart:collection' show UnmodifiableMapView;

@Injectable()
class IconSetRegistry {
  final String defaultIconSetName = '_default_';

  Map<String, BwuIconSetSvg> _iconSets = <String, BwuIconSetSvg>{};
  Map<String, BwuIconSetSvg> _iconSetsView;
  Map<String, BwuIconSetSvg> get iconSets => _iconSetsView;

  final StreamController<String> _iconSetAdded = new StreamController<String>();
  Stream<String> get iconSetAdded => _iconSetAdded.stream;

  IconSetRegistry() {
    _iconSetsView = new UnmodifiableMapView<String, BwuIconSetSvg>(_iconSets);
  }

  void add(String name, BwuIconSetSvg iconSet) {
    _iconSets[name] = iconSet;
    _iconSetAdded.add(name);
  }

  void remove(String name) {
    _iconSets.remove(name);
  }
}
