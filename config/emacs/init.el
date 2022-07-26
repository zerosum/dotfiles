(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Japanese")
 '(custom-enabled-themes '(modus-vivendi))
 '(package-selected-packages '(all-the-icons neotree vertico use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when (require 'package nil t)
  (add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/"))
  (package-initialize))

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  )

;; all-the-icons
(use-package all-the-icons
  :if (display-graphic-p))

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(with-eval-after-load 'neotree
  (setq neo-show-hidden-files t)
  (setq neo-theme (if (display-graphic-p) 'icons)))

(setq scheme-program-name "docker run -it --rm z3r05um/mit-scheme:11.2")
(defadvice run-scheme (before split-window activate)
  (if (= (count-windows) 1) (split-window))
  (other-window 1))
