#!/usr/bin/env perl

use strict;
use warnings;

sub hc {
    my @args = @_;
    print @args;
    #system("herbstclient @_");
}

sub do_config($\%) {
    my ($command, $ref2hash) = @_;
    my %hash = %$ref2hash;

    while(my ($key, $value) = each %hash) {
	print("$command $key $value \n");
    }
}

hc("emit_hook reload");

my $m = "Mod4";
my $s = "Shift";
my $c = "Control";
my $r = "Return";
my $lowerVolume = "XF86AudioLowerVolume";
my $raiseVolume = "XF86AudioRaiseVolume";
my $muteVolume = "XF86AudioMute";
my $brighDown = "XF86MonBrightnessDown";
my $brighUp = "XF86MonBrightnessUp";
my $rofiCommand = "rofi -modi drun -show drun -icon-themes 'Papirus' -show-icons";

my $resizestep = 0.02;

my @tag_names = (1..6);
hc(\@tag_names);
my @tag_keys = (1..6);

my %wm_control_keybindings = (
    "$m-$s-q" => 'quit',
    "$m-$s-r" => 'reload',
    "$m-$s-c" => 'close'
    );

my %program_spawn_keybindings = (
    "$m-$r"   => 'spawn alacritty',
    "$m-$s-$r" => "spawn $rofiCommand",
    "$m-$c-e" => 'spawn emacsclient -c',
    "$m-$c-w" => 'spawn firefox'
    );

my %client_focus_keybindings = (
    "$m-Left"  => 'focus left',
    "$m-Down"  => 'focus down',
    "$m-Up"    => 'focus up',
    "$m-Right" => 'focus right',
    "$m-h"     => 'focus left',
    "$m-j"     => 'focus down',
    "$m-k"     => 'focus up',
    "$m-l"     => 'focus right'
    );

my %move_clients_keybindings = (
    "$m-$s-Left"  => 'shift left',
    "$m-$s-Down"  => 'shift down',
    "$m-$s-Up"    => 'shift up', 
    "$m-$s-Right" => 'shift right',
    "$m-$s-h"     => 'shift left',
    "$m-$s-j"     => 'shift down',
    "$m-$s-k"     => 'shift up',
    "$m-$s-l"     => 'shift right'
    );

my %split_frame_keybindings = (
    "$m-u"        => 'split bottom 0.5',
    "$m-o"        => 'split right 0.5',
    "$m-$c-space" => 'split explode'
    );

my %resize_frame_clients_keys = (
    "$m-$c-h"     => "resize left +$resizestep",
    "$m-$c-j"     => "resize down +$resizestep",
    "$m-$c-k"     => "resize up +$resizestep",
    "$m-$c-l"     => "resize right +$resizestep",
    "$m-$c-Left"  => "resize left +$resizestep",
    "$m-$c-Down"  => "resize down +$resizestep",
    "$m-$c-Up"    => "resize up +$resizestep",
    "$m-$c-Right" => "resize right +$resizestep"
    );

do_config("keybind", %wm_control_keybindings);
