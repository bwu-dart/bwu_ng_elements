library bwu_ng_elements.icon.iconset_svg;

import 'package:angular2/core.dart'
    show
        AfterContentInit,
        Component,
        ContentChildren,
        ElementRef,
        Input,
        OnChanges,
        QueryList,
        SimpleChange;
import 'dart:svg' show SvgElement;
import 'package:bwu_ng_elements/icon/iconset_registry.dart'
    show IconSetRegistry;

/// Allows to provide a set of icons under a name.
@Component(
    selector: 'bwu-iconset-svg',
    template: '<ng-content></ng-content>',
    styles: const [':host { display: none; }'])
class BwuIconSetSvg implements OnChanges, AfterContentInit {
  /// The default value for the size property.
  static int defaultSize = 24;

  ///
  BwuIconSetSvg(this._iconSetRegistry);

  /// References to the icons contained in the icon set.
  @ContentChildren('icon')
  QueryList<ElementRef> icons;

  Map<String, SvgElement> _icons;

  /// The name of the icon set is registered with.
  @Input()
  String name;

  int _size = defaultSize;

  /// The size of the icons in the icon set.
  @Input()
  int get size => _size;

  /// Read the size from the attribute.
  @Input()
  set size(int value) {
    if (value == null || value < 0) {
      return;
    }
    _size = value;
  }

  final IconSetRegistry _iconSetRegistry;

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    changes.forEach((String property, SimpleChange change) {
      if (property == 'name') {
        if (change.previousValue != null &&
            change.previousValue is String &&
            (change.previousValue as String).isNotEmpty) {
          _iconSetRegistry.remove(change.previousValue);
        }
        if (change.currentValue != null &&
            (change.currentValue as String).isNotEmpty) {
          if (_icons != null) {
            _iconSetRegistry.add(change.currentValue, this);
          }
        }
      }
    });
  }

  @override
  void ngAfterContentInit() {
    _icons = _createIconMap();
    _iconSetRegistry.add(name, this);
  }

  /// Get a list of IDs of the icons contained in this icon set.
  List<String> get iconNames {
    final String iconSetPrefix =
        name == _iconSetRegistry.defaultIconSetName ? '' : '$name:';
    return _icons.keys.map((String id) => '$iconSetPrefix$id').toList()
        as List<String>;
  }

  /// Return the SVG for the icon [id].
  SvgElement getIcon(String id) => _icons[id]?.clone(true);

  Map<String, SvgElement> _createIconMap() {
    final Map<String, SvgElement> result = <String, SvgElement>{};
    for (ElementRef icon in icons) {
      result[(icon.nativeElement as SvgElement).id] = icon.nativeElement;
    }
    return result;
  }
}
