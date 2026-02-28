#!/usr/bin/env python3
"""
i3status wrapper that adds a PipeWire volume block with click support.
Left-click on the volume block opens pavucontrol.
"""
import json
import os
import subprocess
import sys
import threading


def get_volume_block():
    try:
        result = subprocess.run(
            ['wpctl', 'get-volume', '@DEFAULT_SINK@'],
            capture_output=True, text=True
        )
        vol_info = result.stdout.strip()
        parts = vol_info.split()
        volume = round(float(parts[1]) * 100)
        muted = '[MUTED]' in vol_info

        if muted or volume == 0:
            text = "󰸈 muted"
            color = "#727169"
        elif volume < 33:
            text = f"󰕿 {volume}%"
            color = None
        elif volume < 66:
            text = f"󰖀 {volume}%"
            color = None
        else:
            text = f"󰕾 {volume}%"
            color = None

        block = {"name": "volume", "instance": "master", "full_text": text}
        if color:
            block["color"] = color
        return block
    except Exception:
        return {"name": "volume", "instance": "master", "full_text": "? vol"}


def handle_clicks():
    for line in sys.stdin:
        line = line.strip().lstrip(',')
        if not line:
            continue
        try:
            click = json.loads(line)
            if not isinstance(click, dict):
                continue
            if click.get('name') == 'volume' and click.get('button') == 1:
                subprocess.Popen(
                    ['pavucontrol'],
                    stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL
                )
        except (json.JSONDecodeError, KeyError):
            pass


click_thread = threading.Thread(target=handle_clicks, daemon=True)
click_thread.start()

i3status_proc = subprocess.Popen(
    ['i3status', '--config', os.path.expanduser('~/.config/i3/scripts/i3status.conf')],
    stdout=subprocess.PIPE, stdin=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    text=True
)

for line_num, line in enumerate(i3status_proc.stdout):
    line = line.rstrip('\n')

    if line_num == 0:
        try:
            header = json.loads(line)
            header['click_events'] = True
            sys.stdout.write(json.dumps(header) + '\n')
        except json.JSONDecodeError:
            sys.stdout.write(line + '\n')
        sys.stdout.flush()
        continue

    if line_num == 1:
        sys.stdout.write(line + '\n')
        sys.stdout.flush()
        continue

    prefix = ''
    data = line
    if line.startswith(','):
        prefix = ','
        data = line[1:]

    try:
        items = json.loads(data)
        items.insert(0, get_volume_block())
        sys.stdout.write(prefix + json.dumps(items, ensure_ascii=False) + '\n')
    except json.JSONDecodeError:
        sys.stdout.write(line + '\n')
    sys.stdout.flush()

i3status_proc.wait()
