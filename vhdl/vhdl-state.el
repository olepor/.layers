
(require 'evil)
(require 'bind-map)
(require 'vhdl-mode)

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

(defconst evil-vhdl-state-commands
  `(
    ("y" . yank-test)
    ("p" . paste-test))
  "List of keys and commands in vhdl-state")

(defun yank-test ()
  (interactive)
  (message "yank"))

(defun paste-test ()
  (interactive)
  (message "paste"))

(dolist (list-element evil-vhdl-state-commands)
  (evil-define-key 'vhdl evil-vhdl-state-map (car list-element) (cdr list-element)))

(evil-define-key 'vhdl evil-vhdl-state-map
  "y" 'yank-test)

(spacemacs|define-micro-state yank
  :doc "[p] - port"
  :bindings
  ("p"
   yank-test
   ))

(spacemacs|define-micro-state paste
  :doc "[c] - component [i] - instance [t] - testbench [s] - signal [q] - quit"
  :on-exit (message "Goodbye")
  :bindings
  ("c" paste-test)
  ("i" paste-test)
  ("t" paste-test)
  ("s" paste-test)
  ("q" evil-vhdl-state))

;; (define-key evil-vhdl-state-map "/" 'evil-normal-state) -- does not work atm
(define-key evil-vhdl-state-map "|" 'evil-normal-state)
(define-key evil-vhdl-state-map "h" 'evil-backward-char)
(define-key evil-vhdl-state-map "j" 'evil-next-visual-line)
(define-key evil-vhdl-state-map "k" 'evil-previous-visual-line)
(define-key evil-vhdl-state-map "l" 'evil-forward-char)
(define-key evil-vhdl-state-map "y" 'yank-test)
(define-key evil-vhdl-state-map "p" 'paste-test)
(define-key evil-vhdl-state-map "y" 'spacemacs/yank-micro-state)
(define-key evil-vhdl-state-map "p" 'spacemacs/paste-micro-state)


(provide 'vhdl-state)
