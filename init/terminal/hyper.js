module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    fontFamily: "'Dank Mono', monospace",

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: "BEAM",

    // blinking cursor
    cursorBlink: true,

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: "#ff79c6",

    // color of the text
    foregroundColor: "#f8f8f2",

    // terminal background color
    backgroundColor: "#282a36",

    // terminal selection color
    selectionColor: "#44475a",

    // border color (window, tabs)
    borderColor: "#44475a",

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: "#282a36",
      lightBlack: "#44475a",
      red: "#ff5555",
      lightRed: "#ffb86c",
      green: "#50fa7b",
      lightGreen: "#50fa7b",
      yellow: "#f1fa8c",
      lightYellow: "#f1fa8c",
      blue: "#6272a4",
      lightBlue: "#6272a4",
      magenta: "#ff79c6",
      lightMagenta: "#bd93f9",
      cyan: "#8be9fd",
      lightCyan: "#8be9fd",
      white: "#f8f8f2",
      lightWhite: "#f8f8f2"
    },
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyperterm-1password",
    "hyperterm-paste",
    "hypercwd",
    "hyperlinks",
    "hyper-statusline",
    "hyper-dracula",
    "hyper-ligatures"
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
