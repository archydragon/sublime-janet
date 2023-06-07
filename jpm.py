import sublime, sublime_plugin
from Default.exec import ExecCommand

import subprocess
import platform


VCVARS_SETTING = "vcvars_bat_path"


def ensure_workdir(variables, kwargs):
    if not kwargs.get('working_dir'):
        kwargs['working_dir'] = variables.get('project_path') or variables.get('folder')
    return kwargs


class JpmBuildCommand(ExecCommand):
    def run(self, **kwargs):
        kwargs = ensure_workdir(self.window.extract_variables(), kwargs)

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

class JpmCleanCommand(ExecCommand):
    def run(self, **kwargs):
        kwargs = ensure_workdir(self.window.extract_variables(), kwargs)

        cmd = []
        if platform.system() == 'Windows':
            cmd = ["jpm.bat", "--verbose", "clean"]
        else:
            cmd = ["jpm", "--verbose", "clean"]

        kwargs['cmd'] = cmd
        super().run(**kwargs)

class JpmTestCommand(ExecCommand):
    def run(self, **kwargs):
        kwargs = ensure_workdir(self.window.extract_variables(), kwargs)

        settings = self.window.active_view().settings()
        cmd = []
        if platform.system() == 'Windows':
            cmd = ["jpm.bat", "--verbose", "test"]
            vcvars = settings.get(VCVARS_SETTING)
            if vcvars:
                cmd.insert(0, vcvars)
                cmd.insert(1, "&")
        else:
            cmd = ["jpm", "--verbose", "test"]

        kwargs['cmd'] = cmd
        super().run(**kwargs)
