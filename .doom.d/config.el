;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
;;

;; Setup ENV for MAC
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vasilis Spilka"
      user-mail-address "vasspilka@gmail.com"
      projectile-project-search-path '("~/Work")
      )

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 18))
(setq display-line-numbers-type nil)



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Sort keys
(setq which-key-sort-order 'which-key-key-order-alpha)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun test-vas()
  (evil-end-of-line)
  (insert " |> IO.inspect"))

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "s-s") 'save-buffer)

;; Configure exunit
(use-package! exunit)

;; Taken off https://gist.github.com/darioghilardi/f3415a3d70d4fee5a20bfad862534a37
;; Elixir configuration

;; I should do instead
;; (add-to-list 'exec-path "${elixir-lsp}/bin")
;; (setq lsp-clients-elixir-server-executable "elixir-ls")

;; Setup some keybindings for exunit and lsp-ui
(map! :mode elixir-mode
      :leader
      :desc "Sort Lines" :nve  "l"    #'sort-lines
      :desc "iMenu" :nve  "c/"    #'lsp-ui-imenu
      :desc "Toggle Test" :nve  "cT"    #'exunit-toggle-file-and-test
      :desc "Inspect" :nve  "cI"    #'test-vas)

(after! lsp-mode
  (dolist (match
           '("[/\\\\].direnv$"
             "[/\\\\]node_modules$"
             "[/\\\\]deps"
             "[/\\\\]priv"
             "[/\\\\]build"
             "[/\\\\]_build"))
    (add-to-list 'lsp-file-watch-ignored match)))

(keychain-refresh-environment)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
