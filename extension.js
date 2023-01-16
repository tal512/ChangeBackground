'use strict';

const St = imports.gi.St;
const Main = imports.ui.main;
const Util = imports.misc.util;
const Me = imports.misc.extensionUtils.getCurrentExtension();

let button;

function _myChangeBackground() {
  Util.spawnCommandLine(`bash ${Me.path}/change-background.sh`);
}

function init() {
  button = new St.Bin({
    style_class: 'panel-button',
    reactive: true,
    can_focus: true,
    track_hover: true
  });

  let icon = new St.Icon({
    icon_name: 'preferences-desktop-wallpaper',
    style_class: 'system-status-icon'
  });

  button.set_child(icon);
  button.connect('button-press-event', _myChangeBackground);
}

function enable() {
  Main.panel._rightBox.insert_child_at_index(button, 0);
}

function disable() {
  Main.panel._rightBox.remove_child(button);
}
