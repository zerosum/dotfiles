(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Japanese")
 '(custom-enabled-themes '(modus-vivendi))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq scheme-program-name "docker run -it --rm z3r05um/mit-scheme:11.2")
(defadvice run-scheme (before split-window activate)
  (if (= (count-windows) 1) (split-window))
  (other-window 1))