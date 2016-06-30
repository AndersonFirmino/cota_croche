# -*- coding: utf-8 -*-
import sys
import os
from PyQt4 import QtWebKit, QtGui, QtCore
from js_object import JS_Object


def config():
	app = QtGui.QApplication(sys.argv)
	app.setApplicationName("Cota Croche")

	pyObj = JS_Object()

	file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "public/index.html"))
	local_url = QtCore.QUrl.fromLocalFile(file_path)

	webView = QtWebKit.QWebView()

	# add javaScript obj in page
	webView.page().mainFrame().addToJavaScriptWindowObject("pyObj", pyObj)

	inspector = QtWebKit.QWebInspector()

	webView.page().settings().setAttribute(
		QtWebKit.QWebSettings.DeveloperExtrasEnabled, True
	)

	inspector.setPage(webView.page())

	webView.load(local_url)

	window = QtGui.QMainWindow()
	window.setWindowTitle("Cota Croche")
	window.resize(800, 500)# funciona para ajustar o tamanho da janela.
	window.setCentralWidget(webView)
	window.show()


	app.exec_()

def main():
	config()


if __name__ == '__main__':
	main()
