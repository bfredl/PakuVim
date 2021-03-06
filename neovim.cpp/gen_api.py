#!/usr/bin/python2
# -*- coding: utf-8 -*-

from jinja2 import Environment, FileSystemLoader
import msgpack, sys, os, subprocess
import re

class InvalidType(Exception):
    pass

class NativeType:
    def __init__(self, name, expect_ref = False):
        self.name = name
        self.expect_ref = expect_ref

REMAP_T = {
    'ArrayOf(Integer, 2)': NativeType('std::vector<Integer>', True),
    'Boolean': NativeType('bool'),
    'String': NativeType('String', True),
    'void': NativeType('void'),
    'Window': NativeType('Window'),
    'Buffer': NativeType('Buffer'),
    'Tabpage': NativeType('Tabpage'),
    'Integer': NativeType('Integer'),
    'Object': NativeType('Object', True),
    'Array':NativeType('Array', True),
    'Dictionary':NativeType('Dictionary', True)
}

def convert_type_to_native(nvim_t, enable_ref_op, const_ref=True, ref=False):
    array_of = r'ArrayOf\(\s*(\w+)\s*\)'
    # print(nvim_t.__class__)
    # print(array_of.__class__)
    obj = re.match(array_of, nvim_t)
    if obj:
        ret = 'std::vector<%s>' % convert_type_to_native(obj.groups()[0], False)
        return 'const ' + ret + '&' if enable_ref_op else ret

    if nvim_t in REMAP_T:
        native_t = REMAP_T[nvim_t]
        if const_ref:
            return 'const ' + native_t.name + '&' if enable_ref_op and native_t.expect_ref else native_t.name
        elif ref:
            return native_t.name + '&' if enable_ref_op and native_t.expect_ref else native_t.name
        else:
            return native_t.name
    else:
        print("unknown nvim type name: " + str(nvim_t))
        raise InvalidType()

    #TODO: implement error handler
    #return nvim_t

def main():
    env = Environment(loader=FileSystemLoader('templates', encoding='utf8'))

    api_info = subprocess.check_output(["nvim", '--api-info'])
    unpacked_api = msgpack.unpackb(api_info, encoding='utf-8')

# generate nvim_api.hpp
    functions = []
    for f in unpacked_api['functions']:

        d = {}
        d['name'] = f['name']

        try:
            d['return'] = convert_type_to_native(f['return_type'], False)
            d['args'] = [{'type': convert_type_to_native(arg[0], True), 'name': arg[1]} for arg in f['parameters']]
            functions.append(d)
        except InvalidType as e:
            print("invalid function = " + str(f))

    # tpl = env.get_template('nvim_api.hpp')
    # api = tpl.render({'functions': functions})
    # with open(os.path.join("./gen", "nvim_api.hpp"), 'w') as f:
    #     f.write(api)

# generate neovim.cpp and neovim.hpp
    REMAP_T['Array'] = NativeType('cArray', True)
    events = []
    for ev in unpacked_api['ui_events']:

        d = {}
        d['name'] = ev['name']
        try:
            d['parameters'] = [{'type': convert_type_to_native(arg[0], True), 'name': arg[1]} for arg in ev['parameters']]
            d['parameters_ncon'] = [{'type': convert_type_to_native(arg[0], True, False, False), 'name': arg[1]} for arg in ev['parameters']]
            d['parameters_nref'] = [{'type': convert_type_to_native(arg[0], True, False), 'name': arg[1]} for arg in ev['parameters']]
            events.append(d)
        except InvalidType as e:
            print("invalid events = " + str(ev))

    # tpl = env.get_template('neovim.hpp')
    # api = tpl.render({'ui_events': events})
    # with open(os.path.join("./gen", "neovim.hpp"), 'w') as f:
    #     f.write(api)
    #
    # tpl = env.get_template('neovim.cpp.1')
    # api = tpl.render({'ui_events': events})
    # with open(os.path.join("./gen", "neovim.cpp"), 'w') as f:
    #     f.write(api)


if __name__ == '__main__':
    main()

