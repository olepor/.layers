;; After much ado, this is actually how you override keymaps in evil :)

;; (defun my-test-map ()
;;   (interactive)
;;   (message "overriding works"))

;; (let ((map LaTeX-mode-map))
;;   (define-key map  "a" 'my-test-map))

;; (evil-make-overriding-map LaTeX-mode-map 'nil)
;; (add-hook 'LaTeX-mode-hook #'evil-normalize-keymaps)


;; ;; Alternatively, if you only want a few keys to override your evil keys,
;; ;; instead of all of them, change the evil-local-map

;; (add-hook 'git-timemachine-hook 
;;           (lambda ()
;;             (define-key evil-normal-state-local-map "n" 'git-timemachine-show-next-revision)))
