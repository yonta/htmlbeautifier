# htmlbeautifier.el

Emacs minor mode to use htmlbeautifier for Ruby on Rails.

## Reqauirement

- htmlbeautifier (Ruby Gem)
- Emacs >= 24.3
- reformatter >= "0.5"
- dash >= "2.17.0"

## Installation

- Example of elisp code. It's supposed to be used with web-mode.

``` elisp
(require 'htmlbeautifier)
(add-hook 'web-mode-hook 'htmlbeautifier-format-on-save-mode)
(setq htmlbeautifier-keep-blank-lines 1)
```

- With leaf.el, like this.

``` elisp
(leaf htmlbeautifier
  :el-get (htmlbeautifier
           :url "https://github.com/yonta/htmlbeautifier.git")
  :hook (web-mode-hook . htmlbeautifier-format-on-save-mode)
  :custom (htmlbeautifier-keep-blank-lines . 1))
```

## Customization

- Run `(customize-group htmlbeautifier)`

## License

- Apache License 2.0. See LICENSE file.
