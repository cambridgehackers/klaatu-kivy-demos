'''
KivyCat Launcher
========
'''

'''
import kivy
kivy.require('1.0.7')
'''

import os.path
from kivy.app import App, Widget
from kivy.uix.carousel import Carousel
from kivy.uix.label import Label
from kivy.uix.image import Image
from kivy.core.window import Window
from kivy.lang import Builder
from apps.touchtracer import Touchtracer, TouchtracerApp

class KlaatuImage(Image):
    pass

class KlaatuLabel(Label):
    pass

class Launcher(Carousel):
    def run_touchtracer(self):
        w = Builder.load_file(os.path.dirname(os.path.realpath(__file__)) + "/apps/touchtracer/touchtracer.kv")
        Window.remove_widget(self)
        Window.add_widget(Touchtracer())

class LauncherApp(App):
    pass

if __name__ == '__main__':
    LauncherApp().run()
