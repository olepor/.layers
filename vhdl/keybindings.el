;; Set the leader keys. Some double
(spacemacs/set-leader-keys-for-major-mode 'vhdl-mode
  "pc" 'vhdl-port-copy
  "pt" 'vhdl-port-paste-testbench
  "pc" 'vhdl-port-copy
  "cp" 'vhdl-port-copy
  "bb" 'vhdl-beautify-buffer
  "tt" 'vhdl-template-map
  "m" 'vhdl-model-map
  "es" 'vhdl-stutter-mode)

(spacemacs/declare-prefix-for-mode 'vhdl-mode "p" "port/paste")
(spacemacs/declare-prefix-for-mode 'vhdl-mode "pt" "testbench")
(spacemacs/declare-prefix-for-mode 'vhdl-mode "pc" "component")
(spacemacs/declare-prefix-for-mode 'vhdl-mode "c" "copy")
(spacemacs/declare-prefix-for-mode 'vhdl-mode "cp" "port")
(spacemacs/declare-prefix-for-mode 'vhdl-mode "b" "beautify")
(spacemacs/declare-prefix-for-mode 'vhdl-mode "e" "enable")
(spacemacs/declare-prefix-for-mode 'vhdl-mode "t" "test")
