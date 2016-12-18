;; Set the leader keys. Some double
(spacemacs/set-leader-keys-for-major-mode 'vhdl-mode
  "pc" 'vhdl-port-copy
  "pt" 'vhdl-port-paste-testbench
  "pc" 'vhdl-port-copy
  "cp" 'vhdl-port-copy)

;; Set the prefixes for the major mode
;;(spacemacs/declare-prefix-for-mode 'vhdl-mode
 ;;                                  "mp" "port/paste"
  ;;                                 "c" "copy"
   ;;                                "cp" "copy port")

