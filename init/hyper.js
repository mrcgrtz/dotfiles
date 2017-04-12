module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 15,

    // font family with optional fallbacks
    fontFamily: '"Fira Code", Hack, "Ubuntu Mono", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#b48ead',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // color of the text
    foregroundColor: '#d8dee9',

    // terminal background color
    backgroundColor: '#2e3440',

    // border color (window, tabs)
    borderColor: '#3b4252',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: `
      x-screen x-row {
        font-variant-ligatures: initial;
      }
    `,

    // set to `true` if you're using a Linux set up
    // that doesn't shows native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#2e3440',
      red: '#bf616a',
      green: '#a3be8c',
      yellow: '#ebcb8b',
      blue: '#5e81ac',
      magenta: '#b48ead',
      cyan: '#88c0d0',
      white: '#d8dee9',
      lightBlack: '#3b4252',
      lightRed: '#d08770',
      lightGreen: '#8fbcbb',
      lightYellow: '#ebcb8b',
      lightBlue: '#81a1c1',
      lightMagenta: '#b48ead',
      lightCyan: '#88c0d0',
      lightWhite: '#eceff4'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperterm-1password',
    'hyperterm-paste',
    'hyperlinks',
    'hyper-blink',
    'hyper-statusline'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
