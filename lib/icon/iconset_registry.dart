library bwu_ng_elements.icon.iconset_registry;

import 'package:angular2/core.dart' show Injectable;
import 'package:bwu_ng_elements/icon/iconset_svg.dart' show BwuIconSetSvg;
import 'dart:async' show Stream, StreamController;
import 'dart:collection' show UnmodifiableMapView;

/// A global registry to register BwuIconSet instances.
@Injectable()
class IconSetRegistry {
  /// The name used
  final String defaultIconSetName = '_default_';

  ///
  IconSetRegistry() {
    _iconSetAddedStream = _iconSetAdded.stream.asBroadcastStream();
    _iconSetsView = new UnmodifiableMapView<String, BwuIconSetSvg>(_iconSets);
  }

  Map<String, BwuIconSetSvg> _iconSets = <String, BwuIconSetSvg>{};
  Map<String, BwuIconSetSvg> _iconSetsView;

  /// Get the map from name to instance of all registered icon sets.
  Map<String, BwuIconSetSvg> get iconSets => _iconSetsView;

  final StreamController<String> _iconSetAdded = new StreamController<String>();
  Stream<String> _iconSetAddedStream;

  /// A stream that emits an event when an iconset is registered.
  Stream<String> get iconSetAdded => _iconSetAddedStream;

  /// Register an iconset.
  void add(String name, BwuIconSetSvg iconSet) {
    _iconSets[name] = iconSet;
    _iconSetAdded.add(name);
  }

  /// Unregister an iconset.
  void remove(String name) {
    _iconSets.remove(name);
  }
}
