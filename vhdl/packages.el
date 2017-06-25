;; pckages.el --- vhdl layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Ole P. Orhagen
;;
;; Author: Ole Petter <olepor@Oles-MBP>
;; URL: https://github.com/olepor/spacemacs
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
    (vhdl-state :location local)
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

(defun toggle-vhdl-state ()
  "Toggle vhdl-state on/off"
  (interactive)
  (if (eq 'vhdl 'evil-state)
      (progn
        (message "State: vhdl -> normal")
        (evil-force-normal-state))
    (evil-vhdl-state)))

(defun update-local-vhdl-keymap ()
  (message "Adding yank-test to the evil-normal-state-local-map")
  (define-key evil-normal-state-local-map "p" 'spacemacs/vhdl-paste-transient-state/evil-paste-after))

(defun vhdl/init-vhdl-mode ()
  (use-package vhdl-mode
    :defer t
    :init
    (message "intialising vhdl-layer")
    (add-hook 'vhdl-mode-hook 'update-local-vhdl-keymap)
    ;; (push "~/.layers/evil-states/" load-path)
    :config
    ;; (add-hook 'vhdl-mode-hook 'update-local-keymap)
    (bind-map evil-vhdl-mode-state-map
      :evil-keys (",")
      :major-modes (vhdl-mode)
      :bindings
      ("," 'toggle-vhdl-state))
    ;; (use-package vhdl-state)
    ;; (evil-define-key 'operator vhdl-mode-map "p" 'vhdl-port-copy)
    ;; (evil-define-key 'motion vhdl-mode-map "p" 'vhdl-port-copy)
    ;; (evil-define-key 'motion evil-normal-state-local-map "p" 'vhdl-port-copy)
    (message "Configuring vhdl-mode")
  ))

(defun vhdl/init-vhdl-state ()
  :defer t
  :init
  (push "~/.layers/evil-states/" load-path) ;; Ugly. Can't make it work otherwise.
  (use-package vhdl-state)
  (message "Initialising vhdl-state")
  :config
  (message "Configuring vhdl-state"))

(defun vhdl/post-init-company ()
  (push 'company-capf company-backends-vhdl-mode)
  )

;;; packages.el ends here
