(require 'evil)
(require 'bind-map)
(require 'vhdl-mode)

(defvar vhdl-state-normal-inherited-keymap (copy-keymap evil-normal-state-map)
  "A copy of the evil-normal-state for vhdl-state")

(evil-define-state vhdl
  "Vhdl State"
  :tag "<V>"
  :message "Vhdl state"
  :cursor evil-emacs-state-cursor
  :suppress-keymap t
  :input-method nil
  :intercept-esc nil)

(evil-define-state vhdl-operator
  "The operator pending state for vhdl-state"
  :tag "<O>"
  :cursor evil-half-cursor
  )

(defconst evil-vhdl-state-keys
  '(("h" . evil-backward-char)
    ("j" . evil-next-visual-line)
    ("k" . evil-previous-visual-line)
    ("l" . evil-forward-char)
    ("y" . yank-test)
    ("p" . paste-test)
    ("n" . move-to-next-vhdl-object)
    ("N" . move-to-previous-vhdl-object)))

(dolist (keycell evil-vhdl-state-keys)
  (let ((key (car keycell))
        (cmd (cdr keycell)))
    (define-key evil-vhdl-state-map (kbd key) cmd)))

(define-key evil-vhdl-state-map [escape] 'evil-force-normal-state) ;; Special case

(provide 'vhdl-state)
