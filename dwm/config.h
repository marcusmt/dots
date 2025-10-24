/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft  = 0;   /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;
static const unsigned int gappx     = 6;
static const char *fonts[]          = { "Hack Nerd Font:size=10" };
static const char col_gray1[]       = "#00141d";
static const char col_gray2[]       = "#80bfff";
static const char col_gray3[]       = "#FFFFFF";
static const char col_gray4[]       = "#1a1a1a";
static const char col_cyan[]        = "#b3e5fc"; /* was #6CF982  */
static const char col_barbie[]      = "#4fc3f7";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray4 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_barbie  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Firefox",  NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int   nmaster     = 1;    /* number of clients in master area */
static const int   resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int   lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int   refreshrate = 120;  /* refresh rate (per second) for client move/resize */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[M]",      monocle },
  { "III",      horizontal },
	{ "[]=",      tile },    /* first entry is default */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", "", "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };

static const Key keys[] = {
	/* modifier              key                         function           argument */
	{ MODKEY,                XK_b,                       togglebar,         {0} },
	{ MODKEY,                XK_Right,                   focusstack,        {.i = +1 } },
	{ MODKEY,                XK_Left,                    focusstack,        {.i = -1 } },
	{ MODKEY,                XK_w,                       killclient,        {0} },
	{ MODKEY,                XK_e,                       setlayout,         {0}},
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,      XK_space,                   togglefloating,    {0} },
	{ MODKEY,                XK_0,                       view,              {.ui = ~0 } },
	{ MODKEY|ShiftMask,      XK_0,                       tag,               {.ui = ~0 } },
	{ MODKEY,                XK_Tab,                     focusmon,          {.i = +1 } },
	{ MODKEY,                XK_x,                       tagmon,            {.i = -1 } },
  { MODKEY|ShiftMask,      XK_Left,                    pushup,            {.i = +1 } },
  { MODKEY|ShiftMask,      XK_Right,                   pushdown,          {.i = -1 } },
	TAGKEYS(                 XK_1,                                          0)
	TAGKEYS(                 XK_2,                                          1)
	TAGKEYS(                 XK_3,                                          2)
	TAGKEYS(                 XK_4,                                          3)
	TAGKEYS(                 XK_5,                                          4)
	{ MODKEY|ShiftMask,      XK_q,                       quit,              {0} },
  { MODKEY,                XK_h,                       scratchpad_hide,   {0} },
  { MODKEY|ShiftMask,      XK_h,                       scratchpad_show,   {0} },
  { MODKEY|ControlMask,    XK_equal,                   scratchpad_remove, {0} },
	{ MODKEY,                XK_space,                   spawn,             SHCMD("rofi -show drun") },
	{ MODKEY,                XK_r,                       spawn,             SHCMD("rofi -show run") },
	{ MODKEY,                XK_Return,                  spawn,             SHCMD("alacritty") },
  { 0,                     XK_Print,                   spawn,             SHCMD("maim -s | ksnip -") },
  { MODKEY,                XK_l,                       spawn,             SHCMD("i3lock") },
  { MODKEY,                XK_z,                       spawn,             SHCMD("dunstctl set-paused true") },
  { MODKEY|ShiftMask,      XK_z,                       spawn,             SHCMD("dunstctl set-paused false") },
  { MODKEY|Mod1Mask,       XK_1,                       spawn,             SHCMD("$HOME/.screenlayout/single.sh") },
  { MODKEY|Mod1Mask,       XK_2,                       spawn,             SHCMD("$HOME/.screenlayout/work.sh") },
  { MODKEY|Mod1Mask,       XK_3,                       spawn,             SHCMD("$HOME/.screenlayout/home.sh") },
  { MODKEY|Mod1Mask,       XK_4,                       spawn,             SHCMD("$HOME/.screenlayout/headless.sh") },
  { 0,                     XF86XK_AudioRaiseVolume,    spawn,             SHCMD("wpctl set-volume -l 1.0 @DEFAULT_SINK@ 0.05+;  $HOME/.config/i3/scripts/volume_notify.sh") },
  { 0,                     XF86XK_AudioLowerVolume,    spawn,             SHCMD("wpctl set-volume @DEFAULT_SINK@ 0.05-;  $HOME/.config/i3/scripts/volume_notify.sh") },
  { 0,                     XF86XK_AudioMute,           spawn,             SHCMD("wpctl set-mute   @DEFAULT_SINK@ toggle; $HOME/.config/i3/scripts/volume_notify.sh") },
  { 0,                     XF86XK_Tools,               spawn,             SHCMD("wpctl set-mute @DEFAULT_SOURCE@ toggle;  $HOME/.config/i3/scripts/mic_notify.sh") },
  { 0,                     XF86XK_MonBrightnessUp,     spawn,             SHCMD("$HOME/.config/i3/scripts/brightness_control.sh brightness_up") },
  { 0,                     XF86XK_MonBrightnessDown,   spawn,             SHCMD("$HOME/.config/i3/scripts/brightness_control.sh brightness_down") },
};

/* button definitions */                                      
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {                             
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};                                                            
                                                              
