#!/usr/bin/env python3
"""Live regression check. Run with --live; briefly changes focus and note visibility.

Requires an existing Stickies window. Never creates, closes, or edits notes.
"""
import argparse
from pathlib import Path
import re
import subprocess
import time

SCRIPT = Path(__file__).resolve().parents[1] / '.config/aerospace/toggle-stickies'


def command(*args):
    return subprocess.check_output(args, text=True, stderr=subprocess.DEVNULL).strip()


def workspace():
    return command('aerospace', 'list-workspaces', '--focused')


def windows():
    return [row.split('|') for row in command(
        'aerospace', 'list-windows', '--all', '--format',
        '%{window-id}|%{workspace}|%{window-layout}|%{app-name}'
    ).splitlines() if row.endswith('|Stickies')]


def visible():
    return any(row[2] != 'macos_native_window_of_hidden_app' for row in windows())


def set_visible(value):
    command('osascript', '-e', 'tell application "System Events" to set '
            f'visible of process "Stickies" to {str(value).lower()}')
    time.sleep(.6)


def launch():
    return subprocess.Popen([str(SCRIPT)])


def finish(process):
    try:
        assert process.wait(timeout=15) == 0, 'toggle failed'
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait()
        raise


def dimensions():
    result = {}
    for row in windows():
        debug = command('aerospace', 'debug-windows', '--window-id', row[0])
        match = re.search(r'"AXSize"[^\n]*w:([\d.]+) h:([\d.]+)', debug)
        assert match, 'cannot read Stickies dimensions'
        result[row[0]] = match.groups()
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--live', action='store_true', required=True)
    parser.parse_args()
    original = windows()
    assert original, 'Open a Stickies note before running this test'
    initial = workspace()
    focus = command('aerospace', 'list-windows', '--focused', '--format', '%{window-id}')
    was_visible = visible()
    other = '4' if initial != '4' else '3'
    failures = []

    def expect(ok, label):
        print(('PASS: ' if ok else 'FAIL: ') + label, flush=True)
        if not ok:
            failures.append(label)

    try:
        set_visible(True)
        before = dimensions()
        set_visible(False)
        for wanted in [True, False] * 3:
            finish(launch())
            expect(visible() == wanted, f'visibility settled on return: {wanted}')
            expect(workspace() == initial, 'normal toggle preserves workspace')
            time.sleep(.3)
        for gap in [.05, .1, .15]:
            set_visible(False)
            first = launch()
            time.sleep(gap)
            second = launch()
            finish(first)
            finish(second)
            time.sleep(.4)
            expect(not visible(), f'double press {gap}s ends hidden')
        for _ in range(3):
            set_visible(False)
            command('aerospace', 'workspace', initial)
            process = launch()
            time.sleep(.1)
            command('aerospace', 'workspace', other)
            finish(process)
            time.sleep(.4)
            expect(workspace() == other, 'mid-show switch is not reversed')
        command('aerospace', 'workspace', initial)
        set_visible(True)
        command('aerospace', 'workspace', other)
        finish(launch())
        expect(visible() and all(row[1] == other for row in windows()),
               'visible notes elsewhere are summoned')
        expect(dimensions() == before, 'note dimensions preserved')
    finally:
        set_visible(True)
        for row in original:
            command('aerospace', 'move-node-to-workspace', '--window-id', row[0], row[1])
        set_visible(was_visible)
        command('aerospace', 'workspace', initial)
        if focus:
            command('aerospace', 'focus', '--window-id', focus)
    assert not failures, '; '.join(failures)


if __name__ == '__main__':
    main()
