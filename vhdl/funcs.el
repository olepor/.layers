
(when (configuration-layer/package-usedp 'vhdl-mode)

  (defun move-to-next-vhdl-object ()
    (interactive)
    (re-search-forward "component\\|instance\\|process\\|entity"))

  (defun move-to-previous-vhdl-object ()
    (interactive)
    (re-search-backward "component\\|instance\\|process\\|entity")))

(defun yank-test ()
  (interactive)
  (message "yank"))

(defun paste-test ()
  (interactive)
  (message "paste"))

(spacemacs|define-transient-state vhdl-paste
  :title "Vhdl-mode-layer paste transient-state"
  :doc "\n[%s(length kill-ring-yank-pointer)/%s(length kill-ring)] \
 [_C-j_/_C-k_] cycles through yanked text, [_p_/_P_] pastes the same text \
 above or below.\n [_c_] - component [_i_] - instance [_t_] - testbench [_s_] - signal \n Anything else exits."
  :bindings
  ("C-j" evil-paste-pop)
  ("C-k" evil-paste-pop-next)
  ("p" evil-paste-after)
  ("P" evil-paste-before)
  ("0" spacemacs//transient-state-0)
  ("c" paste-test)
  ("i" paste-test)
  ("t" paste-test)
  ("s" paste-test))

(spacemacs|define-micro-state paste
  :doc "[c] - component [i] - instance [t] - testbench [s] - signal [q] - quit"
  :on-exit (message "Goodbye")
  :bindings
  ("c" paste-test)
  ("i" paste-test)
  ("t" paste-test)
  ("s" paste-test)
  ("q" evil-vhdl-state))

