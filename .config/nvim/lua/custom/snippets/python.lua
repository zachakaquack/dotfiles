local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = require("luasnip").insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {

  s("ending", {
    t {
      "app = QApplication(sys.argv)",
      "qdarktheme.load_stylesheet()",
      "w = MainWindow()",
      "w.show()",
      "sys.exit(app.exec())",
    },
  }),
  s("qtimports", {
    t {
      "from rich.traceback import install",
      "from PySide6.QtCore import *",
      "from PySide6.QtGui import *",
      "from PySide6.QtWidgets import *",
      "import qdarktheme",
      "import sys",
    },
  }),
  s("dinit", {
    t "def __init__(self, *args, **kwargs):",
    t { "", "  super().__init__(*args, *kwargs)" },
  }),
  s("mainwindow", {
    t {
      "class MainWindow(QMainWindow):",
      "  def __init__(self, *args, **kwargs):",
      "    super().__init__(*args, *kwargs)",
      "",
      "    self.setFixedSize(1280, 720)",
      "",
      "    self.main_widget = QFrame(self)",
      "    self.main_layout = QVBoxLayout(self.main_widget)",
      "    self.main_widget.setLayout(self.main_layout)",
      "",
      "    self.main_layout.setContentsMargins(0, 0, 0, 0)",
      "    self.main_layout.setSpacing(0)",
      "    self.main_layout.setAlignment(",
      "      Qt.AlignmentFlag.AlignTop | Qt.AlignmentFlag.AlignHCenter",
      "    )",
      "",
      "    self.setCentralWidget(self.main_widget)",
      "",
      "  def keyPressEvent(self, event: QKeyEvent, /) -> None:",
      "    if event.key() == Qt.Key.Key_Escape:",
      "      self.close()",
      "",
      "    return super().keyPressEvent(event)",
    },
  }),

  s("layout", {
    t "self.",
    i(1, "main_layout"),
    t " = QVBoxLayout(self)",
    t { "", "self.setLayout(self." },
    rep(1),
    t { ")" },
    t { "", "self." },
    rep(1),
    t ".setContentsMargins(0, 0, 0, 0)",
    t { "", "self." },
    rep(1),
    t ".setSpacing(0)",
    t { "", "self." },
    rep(1),
    t ".setAlignment(",
    t {
      "  Qt.AlignmentFlag.AlignTop | Qt.AlignmentFlag.AlignHCenter",
      ")",
    },
  }),
  s("full", {
    t {
      "from rich.traceback import install",
      "from PySide6.QtCore import *",
      "from PySide6.QtGui import *",
      "from PySide6.QtWidgets import *",
      "import qdarktheme",
      "import sys",
      "",
      "install()",
      "",
      "class MainWindow(QMainWindow):",
      "  def __init__(self, *args, **kwargs):",
      "    super().__init__(*args, *kwargs)",
      "",
      "    self.setFixedSize(1280, 720)",
      "",
      "    self.main_widget = QFrame(self)",
      "    self.main_layout = QVBoxLayout(self.main_widget)",
      "    self.main_widget.setLayout(self.main_layout)",
      "",
      "    self.main_layout.setContentsMargins(0, 0, 0, 0)",
      "    self.main_layout.setSpacing(0)",
      "    self.main_layout.setAlignment(",
      "      Qt.AlignmentFlag.AlignTop | Qt.AlignmentFlag.AlignHCenter",
      "    )",
      "",
      "    self.setCentralWidget(self.main_widget)",
      "",
      "  def keyPressEvent(self, event: QKeyEvent, /) -> None:",
      "    if event.key() == Qt.Key.Key_Escape:",
      "      self.close()",
      "",
      "    return super().keyPressEvent(event)",
      "",
      "",
      "app = QApplication(sys.argv)",
      "qdarktheme.load_stylesheet()",
      "w = MainWindow()",
      "w.show()",
      "sys.exit(app.exec())",
    },
  }),
  s("switcher", {
    t {
      "class Switcher(QFrame):",
      "    def __init__(self, *args, **kwargs):",
      "        super().__init__(*args, **kwargs)",
      "",
      "        self.switchers: list[tuple[str, QWidget]] = []",
      "        self.main_switcher: tuple[str, QWidget] | None = None",
      "",
      "        self.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)",
      "",
      "        self.main_layout = QVBoxLayout(self)",
      "        self.setLayout(self.main_layout)",
      "        self.main_layout.setContentsMargins(0, 0, 0, 0)",
      "        self.main_layout.setSpacing(0)",
      "        self.main_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)",
      "",
      "    def setMainSwitch(self, name: str) -> bool:",
      "        for switch in self.switchers:",
      "            if switch[0] == name:",
      "                self.hideAllSwitches()",
      "                self.main_switcher = switch",
      "                self.main_switcher[1].show()",
      "                return True",
      "        else:",
      "            return False",
      "",
      "    def addSwitcherFromTuple(self, tup: tuple[str, QWidget]) -> bool:",
      "        return self._addSwitcher(tup[0], tup[1])",
      "",
      "    def addSwitcher(self, name: str, widget: QWidget) -> bool:",
      "        return self._addSwitcher(name, widget)",
      "",
      "    def _addSwitcher(self, name: str, widget: QWidget) -> bool:",
      "        for switch in self.switchers:",
      "            if switch[0] == name:",
      "                return False",
      "        self.switchers.append((name, widget))",
      "",
      "        self.main_layout.addWidget(widget)",
      "        widget.hide()",
      "",
      "        if not self.main_switcher:",
      "            self.main_switcher = self.switchers[0]",
      "            self.main_switcher[1].show()",
      "",
      "        return True",
      "",
      "    def hideAllSwitches(self) -> None:",
      "        for switch in self.switchers:",
      "            switch[1].hide()",
      "        return",
      "",
      "    def switchTo(self, name: str) -> bool:",
      "        for switch in self.switchers:",
      "            if switch[0] == name:",
      "                self.hideAllSwitches()",
      "                switch[1].show()",
      "                return True",
      "        else:",
      "            return False",
    },
  }),
  s("setpolicy", {
    t "self.setSizePolicy(",
    t { "", "    QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding" },
    t { "", ")" },
  }),
  s("delchild", {
    t "while (child := self.main_layout.takeAt(0)) != None:",
    t { "", "   if child.widget() and isinstance(child.widget(), QLabel):" },
    t { "", "       child.widget().deleteLater()" },
  }),
  s("imagedialog", {
    t {
      "def _launch_dialog(self) -> None:",
      "    dialog = QFileDialog(",
      "        self,",
      '        filter="PNG (*.png);;BMP (*.bmp);;CUR (*.cur);;GIF (*.gif);;ICNS (*.icns);;ICO (*.ico);;JPEG (*.jpeg);;JPG (*.jpg);;PBM (*.pbm);;PGM (*.pgm);;PPM (*.ppm);;SVG (*.svg);;SVGZ (*.svgz);;TGA (*.tga);;TIF (*.tif);;TIFF (*.tiff);;WBMP (*.wbmp);;WEBP (*.webp);;XBM (*.xbm);;XPM (*.xpm)",',
      "    )",
      "    dialog.fileSelected.connect(self._prepare_file)",
      "    dialog.exec()",
    },
  }),

  s(
    "scrollarea",
    fmt(
      [[
class {}(QScrollArea):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, *kwargs)

        self.setSizePolicy(QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Expanding)

        self.setObjectName("scroller")
        self.setStyleSheet(
            """
            #scroller {{
                border: none;
            }}
            * {{
                background-color: #1e1e1e;
                color: white;
            }}
            """
        )

        self.main_widget = QFrame(self)
        self.main_layout = QVBoxLayout(self.main_widget)
        self.main_widget.setLayout(self.main_layout)
        self.main_layout.setContentsMargins(0, 0, 0, 0)
        self.main_layout.setSpacing(0)
        self.main_layout.setAlignment(
            Qt.AlignmentFlag.AlignTop | Qt.AlignmentFlag.AlignHCenter
        )

        self.setWidgetResizable(True)
        self.setWidget(self.main_widget)

        {}
]],
      {
        i(1, "ScrollArea"),
        i(0),
      }
    )
  ),
}
