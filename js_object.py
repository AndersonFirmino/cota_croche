# -*- coding: utf-8 -*-
from PyQt4 import QtCore, QtGui


class JS_Object(QtCore.QObject):

    @QtCore.pyqtSlot(int)
    def teste(self, numero):
        pass
