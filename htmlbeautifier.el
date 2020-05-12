;;; htmlbeautifier.el --- Reformat ERB using htmlbeautifiler  -*- lexical-binding: t; -*-

;; Copyright (C) 2020 SAITOU Keita

;; Author: SAITOU Keita <keita44.f4@gmail.com>
;; Keywords: languages, convenience, tools
;; Package-Requires: ((emacs "24.3") (reformatter "0.5") (dash "2.17.0"))
;; Version: 0.1

;; This file is distributed under the terms of Apache License (version 2.0).
;; See also LICENSE file.

;;; Commentary:

;; See https://github.com/yonta/htmlbeautifier

;;; Code:

(require 'reformatter)
(require 'dash)

(defcustom htmlbeautifier-indent-type 2
  "Select space or tab for indent.

Default is 2 spaces.
If set nil, use tab.
If set integer, use number of spaces."
  :type '(choice (integer :tag "Use number of space")
                 (const :tag "Use tab" nil))
  :group 'htmlbeautifier)

(defcustom htmlbeautifier-indent-by 0
  "Set offset indent."
  :type 'integer
  :group 'htmlbeautifier
  :safe 'integerp)

(defcustom htmlbeautifier-stop-on-errors nil
  "Stop refomatting when there are invalid nesting."
  :type 'boolean
  :group 'htmlbeautifier
  :safe 'booleanp)

(defcustom htmlbeautifier-keep-blank-lines 0
  "Keep number of blank lines."
  :type 'integer
  :group 'htmlbeautifier
  :safe 'integerp)

(reformatter-define htmlbeautifier-format
  :program "htmlbeautifier"
  :args (-flatten
         (list
          (if htmlbeautifier-indent-type
              `("--tab-stops" ,(number-to-string htmlbeautifier-indent-type))
            "--tab")
          (if htmlbeautifier-stop-on-errors "--stop-on-errors")
          "--keep-blank-lines"
          (number-to-string htmlbeautifier-keep-blank-lines)))
  :group 'htmlbeautifier)

;;;###autoload (autoload 'htmlbeautifier-format-buffer "htmlbeautifier" nil t)
;;;###autoload (autoload 'htmlbeautifier-format-region "htmlbeautifier" nil t)
;;;###autoload (autoload 'htmlbeautifier-format-on-save-mode "htmlbeautifier" nil t)

(provide 'htmlbeautifier)
;;; htmlbeautifier.el ends here
