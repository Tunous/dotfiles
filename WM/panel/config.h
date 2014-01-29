/* The height of the bar (in pixels) */
#define BAR_HEIGHT  14
/* The width of the bar. Set to -1 to fit screen */
#define BAR_WIDTH   -1
/* Offset from the left. Set to 0 to have no effect */
#define BAR_OFFSET 0
/* Choose between an underline or an overline */
#define BAR_UNDERLINE 0
/* The thickness of the underline (in pixels). Set to 0 to disable. */
#define BAR_UNDERLINE_HEIGHT 2
/* Default bar position, overwritten by '-b' switch */
#define BAR_BOTTOM 0
/* The fonts used for the bar, comma separated. Only the first 2 will be used. */
#define BAR_FONT       "-*-stlarch-medium-r-*-*-10-*-*-*-*-*-*-*","-*-tewi-medium-*-*-*-11-*-*-*-*-*-*-*"
/* Some fonts don't set the right width for some chars, pheex it */
#define BAR_FONT_FALLBACK_WIDTH 6
/* Define the opacity of the bar (requires a compositor such as compton) */
#define BAR_OPACITY 1.0 /* 0 is invisible, 1 is opaque */
/* Color palette */
#define BACKGROUND 0x000000
#define COLOR0 0x303030
#define COLOR1 0xaf0000
#define COLOR2 0x87af00
#define COLOR3 0xaf8700
#define COLOR4 0x0087af
#define COLOR5 0xaf0057
#define COLOR6 0x00afaf
#define COLOR7 0x606060
#define COLOR8 0x444444
#define COLOR9 0xa54242
#define FOREGROUND 0x9e9e9e

/* Mouse button to react to */
#define MOUSE_BUTTON 1
