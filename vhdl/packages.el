;;(require 'vhdl-state)
;; pckages.el --- vhdl layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Ole Petter <olepor@Oles-MBP>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `vhdl-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vhdl/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vhdl/pre-init-PACKAGE' and/or
;;   `vhdl/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vhdl-packages
  '(
    vhdl-mode
    vhdl-state
    )
  "The list of Lisp packages required by the vhdl layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun test-print ()
  (message "Test - print!"))

(defun test-hook ()
  (message "Test hook!"))

(defun test-update-normal-map ()
  (message "Updating normal-state-map"))

(defun update-local-keymap ()
  (message "Updating local keymap")
  (evil-define-key 'normal evil-normal-state-local-map "p" 'test-print))

(defun update-normal-state-map ()
  (message "Initialising normal-state-map to add emacs-state key to \\")
  (define-key evil-normal-state-map "|" 'evil-vhdl-state))

(defun vhdl/init-vhdl-mode ()
  (use-package vhdl-mode
    :defer t
    :init
    (message "intialising vhdl-layer")
    :config
    (add-hook 'vhdl-mode-hook 'update-local-keymap)
    (add-hook 'vhdl-mode-hook 'update-normal-state-map)
    ;; (evil-define-key 'operator vhdl-mode-map "p" 'vhdl-port-copy)
    ;; (evil-define-key 'motion vhdl-mode-map "p" 'vhdl-port-copy)
    ;; (evil-define-key 'motion evil-normal-state-local-map "p" 'vhdl-port-copy)
    (message "Configuring vhdl-mode")
  ))

(defun vhdl/post-init-company ()
  (push 'company-capf company-backends-vhdl-mode)
  )

(defun vhdl/init-vhdl-state ()
  (test-print))

;;; packages.el ends here
