#!/usr/bin/env python
from jinja2 import Template, Environment, FileSystemLoader
import os,sys

argv = sys.argv
env = Environment(loader=FileSystemLoader('/template'))
template = env.get_template(argv[1])
path_w = argv[2]
disp_text = template.render(os.environ)
with open(path_w, mode='w') as f:
    f.write(disp_text)
