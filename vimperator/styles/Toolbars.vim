style -name Toolbars * <<EOF

@namespace url(http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);

/* Small tweaks {{{ */

/* Hide back button if it's disabled */
#back-button[disabled] { visibility: collapse !important; }

/* }}} */
/* Bookmarks and navigation bar {{{ */

#nav-bar,
#PersonalToolbar {
  background: #eee !important;
  padding: 0 3px 0 25px !important;
  margin: 0 1px 0 1px !important;

  border: none !important;
  border-radius: 0 !important;
}

#PersonalToolbar {
  display: none;
  border-top: none !important;
}

/* Show bookmarks on hover and newtab page */
#main-window[stylish-url="about:newtab"] #PersonalToolbar,
#PersonalToolbar[customizing],
#nav-bar[customizing],
#navigator-toolbox:hover #PersonalToolbar,
#navigator-toolbox:hover #nav-bar {
  display: inherit;
}

/* }}} */
/* Addons bar {{{ */

#addon-bar:not([customizing]) {
  padding: 2px 2px 2px 0 !important;

  border: 0 !important;
  border-radius: 0 3px 0 5px !important;

  background: #eee !important;

  box-shadow: 0 0 0 1px rgba(0,0,0,.25) inset,
  0 0 0 2px rgba(255,255,255,.5) inset !important;

  position: fixed !important;
  left: 1px !important;

  height: 23px !important;

  /* Animation (hiding) */
  bottom: -23px !important;
  opacity: 0.5 !important;
  -moz-transition: bottom 0.25s 0.5s ease-in, opacity 0.1s 0.65s ease-in !important;
}

/* Animation (showing) */
#addon-bar:hover {
  bottom: 0px !important;
  opacity: 1 !important;
  -moz-transition: bottom .25s .25s, opacity 0.01s 0.25s !important;
}

/* Show addons bar box */

/* Hide close button */
#addonbar-closebutton {
  display: none !important;
}

#addon-bar > toolbarspacer,
#addon-bar > toolbarspring {
  background: #ddd !important;

  box-shadow: 0 0 0 1px rgba(0,0,0,.25) inset !important;

  border-radius: 0 0 0 4px !important;

  height: 20px !important;
  width: 25px !important;

  position: absolute  !important;
  left: 0 !important;
  top: -20px !important;

  opacity: 1 !important;
  -moz-transition: opacity 0.5s 0.75s !important;
}
#addon-bar:hover > toolbarspacer,
#addon-bar:hover > toolbarspring {
  opacity: 0 !important;
  -moz-transition: opacity 0.05s 0.25s !important;
}
/* }}} */

EOF

" End {{{
" vim: ts=2 sw=2 sts=2 foldmethod=marker foldlevel=0 ft=css
