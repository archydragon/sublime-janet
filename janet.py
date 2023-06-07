import sublime, sublime_plugin
from Default.exec import ExecCommand

import subprocess
import platform


VCVARS_SETTING = "vcvars_bat_path"

class JanetExecCommand(ExecCommand):
    def run(self, **kwargs):
        variables = self.window.extract_variables()
        print(variables)

        for key in ("cmd", "shell_cmd", "working_dir"):
            if key in kwargs:
                kwargs[key] =  sublime.expand_variables(kwargs[key], variables)

        super().run(**kwargs)
