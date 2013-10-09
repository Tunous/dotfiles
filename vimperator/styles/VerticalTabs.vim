style -name VerticalTabs * <<EOF

@namespace url(http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);


/* Default style tweaks {{{ */

.tabbrowser-tab .tab-icon-image { margin: 3px 0 8px 0px !important; } /**/

/* }}} */
/* Tabs {{{ */

/* Tabs panel {{{ */

#tabbrowser-tabs {
  background: #eee !important;

  border: none !important;
  border-radius: 0 0 0 4px !important;
  border-radius: 0 !important;

  /* Size 25px */
  min-width: 325px !important;
  max-width: 325px !important;
  margin-right: -300px !important;
  padding-top: 30px !important;
}

/* }}} */
/* Tabs {{{ */

.tabbrowser-tab {
  background: none !important;

  border: none !important;
  border-radius: 0 !important;

  max-height: 23px !important;
  min-height: 23px !important;

  max-width: -moz-fit-content !important;
  min-width: -moz-fit-content !important;
  width: -moz-fit-content !important;

  /* Correct popup size */
  display: list-item !important;

  margin: 1px 0 1px 0 !important;
}

/* }}} */
/* Selected tab {{{ */

.tabbrowser-tab[selected] {
  background: white !important;
  box-shadow: -2px 0 5px rgba(0,0,0,.2) !important;
}
.tabbrowser-tab[selected]:hover {
  background-color: rgb(60,80,100) !important;
}

/* }}} */
/* Pinned tab {{{ */

.tabbrowser-tab[pinned] {
  background: #ddd !important;
  border-radius: 10px 0 0 10px !important;
}

/* }}} */
/* Small tweaks {{{ */

.tabbrowser-tab .tab-icon-image { margin: 0 0 4px 0; }
.tabbrowser-tab:not([pinned]) .tab-icon-image:not([src]) { visibility: visible !important; }
.tabbrowser-tab:first-child { margin-top: 5px !important; }
.tabbrowser-tab[busy]:hover:not([selected]) .tab-text { margin-left: 0px !important; }
.tabbrowser-tab[titlechanged]:not([selected]) { background: rgb(240,200,100) !important; }

/* }}} */

/* }}} */
/* Popup text {{{ */

.tabbrowser-tab:not(:hover) .tab-text {
  visibility: collapse !important;
  width: 0 !important;
  max-width: 0 !important;
}
.tabbrowser-tab:hover .tab-text {
  max-height: 23px !important;
  min-height: 23px !important;

  max-width: 300px !important;
  min-width: -moz-fit-content !important;
  width: -moz-fit-content !important;

  color: white !important;
  background-color: rgb(60,80,100) !important;

  border: 3px solid rgb(60,80,100) !important;
  border-radius: 0 4px 4px 0 !important;

  padding: 0 5px 0 5px !important;
  margin: 0 0 4px 5px !important;

  display: table-cell !important;

  -moz-transition: max-width .5s !important;
}

/* Make popups appear on top of main window */
.tabbrowser-tab > .tab-stack {
  z-index: 1;
  position: relative;
}

/* }}} */
/* Close button {{{ */

/* Swap text & close button */
.tabbrowser-tab .tab       { -moz-box-ordinal-group: 3 !important; }
.tabbrowser-tab .tab-label { -moz-box-ordinal-group: 4 !important; }

/* Hide close button */
.tabbrowser-tab .tab-close-button {
  visibility: collapse !important;
}
/* Show close button on hover */
.tabbrowser-tab[selected]:not([pinned]):hover .tab-close-button {
  visibility: visible !important;
  margin: 0 -2px 3px 0 !important;
}

/* Hide favicon and throbber on hover */
.tabbrowser-tab[selected]:not([pinned]):hover .tab-icon-image,
.tabbrowser-tab[selected]:not([pinned]):hover .tab-throbber {
  display: none !important;
}

/* }}} */
/* Fixes {{{ */

/* Reomver splitter and theme stuff */
.tab-content { border: none !important; }
#verticaltabs-splitter { display: none !important; }

/* Fix padding caused by tab arrows */
.tabbrowser-arrowscrollbox > .arrowscrollbox-scrollbox {
  -moz-padding-start: 0 !important;
  -moz-padding-end: 0 !important;
}

/* Main window */
#main-window browser {
  /*border-radius: 4px 0 0 0 !important;*/
  box-shadow: 0 0 10px 3px rgba(0,0,0,.2) !important;
}

/* Make vimperator box show on top of tabs */
.liberator-container { z-index: 999 !important; }

/* }}} */

EOF

" End {{{
" vim: ts=2 sw=2 sts=2 foldmethod=marker foldlevel=0 ft=css
