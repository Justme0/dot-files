(eval-after-load "org"
  '(require 'ox-md nil t))

(setq explicit-shell-file-name "bash")
(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)

(global-linum-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "WenQuanYi Micro Hei Mono" :foundry "WQYF" :slant normal :weight normal :height 128 :width normal)))))
