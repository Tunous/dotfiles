style -name Scrollbars * <<EOF

@namespace url(http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul);

/* Size {{{ */

scrollbar[orient="vertical"]        { width: 5px !important; }
scrollbar[orient="horizontal"] { height: 5px !important; }

/* }}} */
/* Apperanrce {{{ */

scrollbar thumb {
  -moz-appearance: none !important;
  border: none !important;
  background: #444 !important;
  opacity: 0.5 !important;
}
scrollbar>slider { background: #EEE !important; }
scrollbar thumb:hover { opacity: 0.75 !important; }
scrollbar thumb:active { opacity: 1 !important; }

/* }}} */
/* Hide scrollbar buttons {{{ */

scrollbar scrollbarbutton { visibility: collapse !important; }

/* }}} */

EOF

" End {{{
" vim: ts=2 sw=2 sts=2 foldmethod=marker foldlevel=0 ft=css
