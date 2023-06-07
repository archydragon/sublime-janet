import sublime, sublime_plugin
from Default.exec import ExecCommand

import subprocess
import platform


VCVARS_SETTING = "vcvars_bat_path"

class JpmBuildCommand(ExecCommand):
    def run(self, **kwargs):
        settings = self.window.active_view().settings()

        cmd = []
        if platform.system() == 'Windows':
            cmd = ["jpm.bat", "--verbose", "build"]
            vcvars = settings.get(VCVARS_SETTING)
            if vcvars:
                cmd.insert(0, vcvars)
                cmd.insert(1, "&")
        else:
            cmd = ["jpm", "--verbose", "build"]

        kwargs['cmd'] = cmd
        super().run(**kwargs)
