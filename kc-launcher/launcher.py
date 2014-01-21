'''
KivyCat Launcher
================
'''

import os.path
import kivy
from kivy.app import App, Widget
from kivy.uix.button import Button
from kivy.uix.image import Image
from kivy.uix.label import Label
from kivy.uix.screenmanager import ScreenManager, Screen, SwapTransition
from kivy.lang import Builder
from apps.touchtracer import Touchtracer, TouchtracerApp

kivy.require('1.7.0')

class KlaatuButton(Button):
    pass

class KlaatuImage(Image):
    pass

class KlaatuLabel(Label):
    pass

class Launcher(Screen):
    pass

class LauncherScreen(Screen):
    pass

class LauncherApp(App):
    def build_screen_touchtracer(self):
        # Build the Touchtracer demo app
        touchtracer = Builder.load_file(os.path.dirname(os.path.realpath(__file__)) + "/apps/touchtracer/touchtracer.kv")
        touchtracer_screen = Screen(name = 'Touchtracer')
        touchtracer_screen.add_widget(Touchtracer())
        return touchtracer_screen

    def build(self):
        root = ScreenManager(transition = SwapTransition(duration = .75))
        root.add_widget(LauncherScreen(name = 'Main'))
        root.add_widget(self.build_screen_touchtracer())
        return root

if __name__ == '__main__':
    LauncherApp().run()
