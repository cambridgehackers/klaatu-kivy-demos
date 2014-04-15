'''
KivyCat Launcher
================
'''

import os
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

class LauncherScreen(Screen):
    pass

class LauncherApp(App):
    # Run the Touchtracer demo.
    def run_touchtracer(self):
        if not self.root.has_screen('Touchtracer'):
            touchtracer = Builder.load_file(os.path.dirname(os.path.realpath(__file__)) + "/apps/touchtracer/touchtracer.kv")
            touchtracer_screen = Screen(name = 'Touchtracer')
            touchtracer_screen.add_widget(Touchtracer(self.root))
            self.root.add_widget(touchtracer_screen)
        self.root.current = self.root.next()

    def power_off(self):
        os.system('poweroff -d0 -f')

    def switch_qml(self):
        os.system('setprop sys.ui.config qt')

    def build(self):
        root = ScreenManager(transition = SwapTransition(duration = .75))
        root.add_widget(LauncherScreen(name = 'Main'))
        return root

if __name__ == '__main__':
    LauncherApp().run()
