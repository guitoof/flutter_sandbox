import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class CustomDelegate implements DiagnosticsSerializationDelegate {
  /// Creates an [InspectorSerializationDelegate] that serialize [DiagnosticsNode]
  /// for Flutter Inspector service.
  CustomDelegate({
    this.groupName,
    this.summaryTree = true,
    this.maxDescendentsTruncatableNode = -1,
    this.expandPropertyValues = true,
    this.subtreeDepth = 1,
    this.includeProperties = false,
    required this.service,
    this.addAdditionalPropertiesCallback,
  });

  /// Service used by GUI tools to interact with the [WidgetInspector].
  final WidgetInspectorService service;

  /// Optional `groupName` parameter which indicates that the json should
  /// contain live object ids.
  ///
  /// Object ids returned as part of the json will remain live at least until
  /// [WidgetInspectorService.disposeGroup()] is called on [groupName].
  final String? groupName;

  /// Whether the tree should only include nodes created by the local project.
  final bool summaryTree;

  /// Maximum descendents of [DiagnosticsNode] before truncating.
  final int maxDescendentsTruncatableNode;

  @override
  final bool includeProperties;

  @override
  final int subtreeDepth;

  @override
  final bool expandPropertyValues;

  /// Callback to add additional experimental serialization properties.
  ///
  /// This callback can be used to customize the serialization of DiagnosticsNode
  /// objects for experimental features in widget inspector clients such as
  /// [Dart DevTools](https://github.com/flutter/devtools).
  /// For example, [Dart DevTools](https://github.com/flutter/devtools)
  /// can evaluate the following expression to register a VM Service API
  /// with a custom serialization to experiment with visualizing layouts.
  ///
  /// The following code samples demonstrates adding the [RenderObject] associated
  /// with an [Element] to the serialized data for all elements in the tree:
  ///
  /// ```dart
  /// Map<String, Object> getDetailsSubtreeWithRenderObject(
  ///   String id,
  ///   String groupName,
  ///   int subtreeDepth,
  /// ) {
  ///   return _nodeToJson(
  ///     root,
  ///     InspectorSerializationDelegate(
  ///       groupName: groupName,
  ///       summaryTree: false,
  ///       subtreeDepth: subtreeDepth,
  ///       includeProperties: true,
  ///       service: this,
  ///       addAdditionalPropertiesCallback: (DiagnosticsNode node, _SerializationDelegate delegate) {
  ///         final Map<String, Object> additionalJson = <String, Object>{};
  ///         final Object value = node.value;
  ///         if (value is Element) {
  ///           final renderObject = value.renderObject;
  ///           additionalJson['renderObject'] = renderObject?.toDiagnosticsNode()?.toJsonMap(
  ///             delegate.copyWith(
  ///               subtreeDepth: 0,
  ///               includeProperties: true,
  ///             ),
  ///           );
  ///         }
  ///         return additionalJson;
  ///       },
  ///     ),
  ///  );
  /// }
  /// ```
  final Map<String, Object>? Function(DiagnosticsNode, CustomDelegate)?
      addAdditionalPropertiesCallback;

  final List<DiagnosticsNode> _nodesCreatedByLocalProject = <DiagnosticsNode>[];

  // bool get _interactive => groupName != null;

  @override
  Map<String, Object?> additionalNodeProperties(DiagnosticsNode node) {
    final Map<String, Object?> result = <String, Object?>{};
    // final Object? value = node.value;
    result['Hello'] = 'World';
    // if (_interactive) {
    //   result['objectId'] = service.toId(node, groupName!);
    //   result['valueId'] = service.toId(value, groupName!);
    // }
    // if (summaryTree) {
    //   result['summaryTree'] = true;
    // }
    // final _Location? creationLocation = _getCreationLocation(value);
    // if (creationLocation != null) {
    //   result['locationId'] = _toLocationId(creationLocation);
    //   result['creationLocation'] = creationLocation.toJsonMap();
    //   if (service._isLocalCreationLocation(creationLocation)) {
    //     _nodesCreatedByLocalProject.add(node);
    //     result['createdByLocalProject'] = true;
    //   }
    // }
    // if (addAdditionalPropertiesCallback != null) {
    //   result.addAll(
    //       addAdditionalPropertiesCallback!(node, this) ?? <String, Object>{});
    // }
    return result;
  }

  @override
  DiagnosticsSerializationDelegate delegateForNode(DiagnosticsNode node) {
    // The tricky special case here is that when in the detailsTree,
    // we keep subtreeDepth from going down to zero until we reach nodes
    // that also exist in the summary tree. This ensures that every time
    // you expand a node in the details tree, you expand the entire subtree
    // up until you reach the next nodes shared with the summary tree.
    return summaryTree || subtreeDepth > 1
        // service._shouldShowInSummaryTree(node)
        ? copyWith(subtreeDepth: subtreeDepth - 1)
        : this;
  }

  @override
  List<DiagnosticsNode> filterChildren(
      List<DiagnosticsNode> nodes, DiagnosticsNode owner) {
    return nodes;
    // return service._filterChildren(nodes, this);
  }

  @override
  List<DiagnosticsNode> filterProperties(
      List<DiagnosticsNode> nodes, DiagnosticsNode owner) {
    final bool createdByLocalProject =
        _nodesCreatedByLocalProject.contains(owner);
    return nodes.where((DiagnosticsNode node) {
      return !node.isFiltered(
          createdByLocalProject ? DiagnosticLevel.fine : DiagnosticLevel.info);
    }).toList();
  }

  @override
  List<DiagnosticsNode> truncateNodesList(
      List<DiagnosticsNode> nodes, DiagnosticsNode? owner) {
    // if (maxDescendentsTruncatableNode >= 0 &&
    //     owner!.allowTruncate == true &&
    //     nodes.length > maxDescendentsTruncatableNode) {
    //   nodes = service._truncateNodes(nodes, maxDescendentsTruncatableNode);
    // }
    return nodes;
  }

  @override
  DiagnosticsSerializationDelegate copyWith(
      {int? subtreeDepth, bool? includeProperties}) {
    return CustomDelegate(
      groupName: groupName,
      summaryTree: summaryTree,
      maxDescendentsTruncatableNode: maxDescendentsTruncatableNode,
      expandPropertyValues: expandPropertyValues,
      subtreeDepth: subtreeDepth ?? this.subtreeDepth,
      includeProperties: includeProperties ?? this.includeProperties,
      service: service,
      addAdditionalPropertiesCallback: addAdditionalPropertiesCallback,
    );
  }
}
