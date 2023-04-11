import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class VPNestListView extends StatefulWidget {
  @override
  _VPNestListViewState createState() => _VPNestListViewState();
}

class _VPNestListViewState extends State<VPNestListView> {
  PageController? _pageController;
  ScrollController? _listScrollController;
  ScrollController? _activeScrollController;
  Drag? _drag;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _listScrollController = ScrollController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    _listScrollController?.dispose();
    super.dispose();
  }

  void _handleDragStart(DragStartDetails details) {
    ///先判断 Listview 是否可见或者可以调用
    ///一般不可见时 hasClients false ，因为 PageView 也没有 keepAlive
    if (_listScrollController?.hasClients == true && _listScrollController?.position.context.storageContext != null) {
      ///获取 ListView 的  renderBox
      final RenderBox? renderBox =
          _listScrollController?.position.context.storageContext.findRenderObject() as RenderBox;

      ///判断触摸的位置是否在 ListView 内
      ///不在范围内一般是因为 ListView 已经滑动上去了，坐标位置和触摸位置不一致
      if (renderBox?.paintBounds.shift(renderBox.localToGlobal(Offset.zero)).contains(details.globalPosition) == true) {
        _activeScrollController = _listScrollController;
        _drag = _activeScrollController?.position.drag(details, _disposeDrag);
        return;
      }
    }

    ///这时候就可以认为是 PageView 需要滑动
    _activeScrollController = _pageController;
    _drag = _pageController?.position.drag(details, _disposeDrag);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_activeScrollController == _listScrollController &&

        ///手指向上移动，也就是快要显示出底部 PageView
        details.primaryDelta! < 0 &&

        ///到了底部，切换到 PageView
        _activeScrollController?.position.pixels == _activeScrollController?.position.maxScrollExtent) {
      ///切换相应的控制器
      _activeScrollController = _pageController;
      _drag?.cancel();

      ///参考  Scrollable 里的，
      ///因为是切换控制器，也就是要更新 Drag
      ///拖拽流程要切换到 PageView 里，所以需要  DragStartDetails
      ///所以需要把 DragUpdateDetails 变成 DragStartDetails
      ///提取出 PageView 里的 Drag 相应 details
      _drag = _pageController?.position.drag(
          DragStartDetails(globalPosition: details.globalPosition, localPosition: details.localPosition), _disposeDrag);
    }
    _drag?.update(details);
  }

  void _handleDragEnd(DragEndDetails details) {
    _drag?.end(details);
  }

  void _handleDragCancel() {
    _drag?.cancel();
  }

  ///拖拽结束了，释放  _drag
  void _disposeDrag() {
    _drag = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("VPNestListView"),
      ),
      extendBody: true,
      body: RawGestureDetector(
        gestures: <Type, GestureRecognizerFactory>{
          VerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(), (VerticalDragGestureRecognizer instance) {
            instance
              ..onStart = _handleDragStart
              ..onUpdate = _handleDragUpdate
              ..onEnd = _handleDragEnd
              ..onCancel = _handleDragCancel;
          })
        },
        behavior: HitTestBehavior.opaque,
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,

          ///去掉 Android 上默认的边缘拖拽效果
          scrollBehavior: ScrollConfiguration.of(context).copyWith(overscroll: false),

          ///屏蔽默认的滑动响应
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ScrollConfiguration(

                ///去掉 Android 上默认的边缘拖拽效果
                behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
                child: KeepAliveListView(
                  listScrollController: _listScrollController,
                  itemCount: 30,
                )),
            Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  'Page View',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

///对 PageView 里的 ListView 做 KeepAlive 记住位置
class KeepAliveListView extends StatefulWidget {
  final ScrollController? listScrollController;
  final int itemCount;

  KeepAliveListView({
    required this.listScrollController,
    required this.itemCount,
  });

  @override
  KeepAliveListViewState createState() => KeepAliveListViewState();
}

class KeepAliveListViewState extends State<KeepAliveListView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      controller: widget.listScrollController,

      ///屏蔽默认的滑动响应
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(title: Text('List Item $index'));
      },
      itemCount: widget.itemCount,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
