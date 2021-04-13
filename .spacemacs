;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(

     command-log

     erlang
     fsharp
     ;; scala
     ;; scala-lsp
     common-lisp
     php
     haskell

     (elixir :variables
             elixir-backend 'lsp
             elixir-ls-path "~/.elixir-lsp/release"
             :init
             (add-to-list 'exec-path "~/.elixir-lsp/release/language_server.sh"))


     ;; erlang
     ;; ocaml
     racket
     latex
     yaml
     sql
     markdown
     javascript
     (clojure :variables
              clojure-enable-clj-refactor t
              clojure-enable-linters 'clj-kondo)
     ;; clojure-lint
     csv
     html

     plantuml

     (mu4e :variables
           mu4e-installation-path "/usr/local/share/emacs/site-lisp/mu/mu4e/")

     ;; (helm :variables
     ;;       helm-use-fuzzy 'always
     ;;       ;; helm-M-x-fuzzy-match t
     ;;       ;; helm-mode-fuzzy-match t
     ;;       )

     ivy

     (auto-completion :variables
                      auto-completion-return-key-behavior 'nil
                      auto-completion-tab-key-behavior 'cycle)

     multiple-cursors

     emacs-lisp
     git
     (org :variables
          org-indent-mode nil
          org-edit-src-content-indentation 0 ; vielleicht überflüssig
          org-enable-reveal-js-support t
          org-hide-emphasis-markers nil
          org-bullets-mode t
          org-bullets-bullet-list '("⚫" "◉" "◎" "○" "►" "◇")
          org-emphasis-alist '(("*" bold)
                               ("/" italic)
                               ("_" underline)
                               ("=" (:foreground "#EFCA08" :background "#555555"))
                               ("~" org-verbatim verbatim)
                               ("+" (:strike-through t))))

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; (spell-checking :variables spell-checking-enable-auto-dictionary t
     ;;                 enable-flyspell-auto-completion t)
     syntax-checking
     ;; version-control

     ;; fancy pdf reader
     ;; pdf-tools

     themes-megapack
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     exunit
     langtool
     mu4e-alert
     keyfreq)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages
   '(
     alchemist
     smartparens
     rainbow-delimiters
     org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;;; #dark#
                         doom-monokai-classic
                         ;; monokai

                         ;;; #light#
                         doom-one-light
                         ;; leuven
                         )
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator arrow :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "Emacs"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; org-capture funktioniert nicht weil Variable nicht bekannt, deshalb setzen
  (setq org-indent-indentation-per-level 0)

  ;; org-refile funktioniert nicht wegen
  ;; "Invalid function: org-preserve-local-variables"
  ;; Dann: lösche kompilierte Dateien und rekompiliere:
  ;; `cd ~/.emacs.d && find . -name *.elc -print0 | xargs -0 rm`
  ;; Danach `M-x spacemacs/recompile-elpa`

  ;; falls which-key mal langsam sein sollte, einfach
  ;; (setq which-key-replacement-alist nil)
  ;; ausführen.

  ;; FIX for helm fuzzy
  ;; Only `helm-flex' in this list breaks NS auto-complete in clojure
  ;; (setq completion-styles '(basic partial-completion emacs22 helm-flex))

  ;; Das hier setzen, falls command-history Duplikate zeigt
  (setq  history-delete-duplicates t)
  ;; Falls man die History begrenzen möchte in der Größe
  (setq history-length 150)
  ;; (setq extended-command-history nil)  ; hiermit manuell die ganze Liste löschen

  ;;; SCALA LSP
  ;; auto vervollständigung oder ähnliches wegen scala
  ;; (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)

  ;; Hack to make sure 'company-lsp is only pushed after company package is loaded
  ;; (use-package company
  ;;   :config
  ;;   (push 'company-lsp company-backends))

  ;; (setq company-lsp-async t)

  ;;; DESKTOP SAVE MODE
  ;; Um den Bufferzustand beim beenden von Emacs beizubehalten
  (desktop-save-mode)
  ;; (desktop-read)  ausführen, um den Inahlt beim Neustart angezeigt zu bekommen

  ;;; clean-buffer-list, kills all saved buffers, that were unused since min 3 days
  ;; (clean-buffer-list)
  ;;; midnight-mode: does clean-buffer-list once every day
  ;; (midnight-mode)

  ;;; ORG EASY STRUCTURE TEMPLATE
  ;; To use org easy structure templates
  ;; (also `<s' für Code-Beispiel)
  (require 'org-tempo)

    ;; Fix, because currently broken, see: https://github.com/syl20bnr/spacemacs/issues/11798
  (setq org-structure-template-alist (cons '("n". "#+BEGIN_NOTES ? #+END_NOTES") (cdr org-structure-template-alist)))

  ;;; org-mode disable indentation after return
  (add-hook 'org-mode-hook (lambda () (electric-indent-mode -1)))

  ;;; Automatic highlight symbol
  (spacemacs/toggle-automatic-symbol-highlight)

  ;;; Magit keybinding
  (bind-key (kbd "C-x g") 'magit)

  ;;; Auto-Completion
  (global-company-mode)
  (setq company-idle-delay 0.5)
  (bind-key (kbd "C-<return>") 'company-complete)

  ;;; Disable Undo-tree-mode
  (global-undo-tree-mode nil)

  ;;; Um markierte Region zu loeschen bei Tastatureingabe
  (delete-selection-mode 1)

  ;;; Paredit automatisch laden
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojurescript-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)

  ;;; clj-refactor don't warn when using `cljr-find-usages`
  (setq cljr-warn-on-eval nil)

  ;;; clj-kondo Clojure LINTER
  ;; (use-package clojure-mode
  ;;   :ensure t
  ;;   :config
  ;;   (require 'flycheck-clj-kondo))

  ;;; So geht das Scrolling bei langen Zeilen hoffentlich schneller
  (setq-default bidi-display-reordering nil)
  (setq fast-but-imprecise-scrolling t)

  ;;; ORG capture TODOS etc
  ;; open Todo file
  (bind-key (kbd "C-c f") (lambda () (interactive) (find-file "~/org/todos.org")))

  ;; This is somehow needed for storing a link from a message for capturing
  (require 'org-mu4e)

  ;;; Org-capture-templates
  (setq org-capture-templates
        `(("t" "Todo mit Datei-Link" entry (file+headline "todos.org" "Inbox")
           "* TODO %?\n %i %a" :prepend t)
          ("z" "Todo" entry (file+headline "todos.org" "Inbox")
           "* TODO %?\n %i" :prepend t)))

  (setq org-agenda-files '("~/org"))
  (setq org-default-notes-file "todos.org")
  (setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

  ;;; org-notify um an Termine zu erinnern
  (require 'org-notify)
  (org-notify-add 'daily
                  '(:time "5m" :period "2m" :duration 100
                          :actions -notify)
                  '(:time "5m" :period "2m" :duration 100
                          :actions (-message -ding)))
  (org-notify-start)

  ;; I do not want to show the daily TODOs in agenda view
  ;; see: https://orgmode.org/manual/Special-Agenda-Views.html
  (defun my-skip-fn ()
    "Skip daily"
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if (and (re-search-forward "notify" subtree-end t)
               (re-search-forward "daily" subtree-end t))
          subtree-end
        nil)))

  (setq org-agenda-skip-function-global
        'my-skip-fn)


  ;;; Dadurch werden nach einem
  ;;; - refile von capture
  ;;; - finish von capture
  ;;; - TODOstatus zu DONEstatus in org-agenda
  ;;; die org-Dateien direkt gespeichert
  (advice-add 'org-refile :after 'org-save-all-org-buffers)
  (advice-add 'org-capture-finalize :after 'org-save-all-org-buffers)
  (advice-add 'org-agenda-todo :after 'org-save-all-org-buffers)

  ;;; org-reveal
  (setq org-reveal-root "file:///home/kaan/tmp/reveal.js")

  ;;; Backup Files:
  (load-file "~/.elisp-files/backup.el")

  ;;; Protokoll-Template
  (load-file "~/.elisp-files/protokoll-template.el")
  (bind-key (kbd "C-x p") 'protocol-template)

  ;;; Record-Tipperleichterung
  (load-file "~/.elisp-files/insert-define-record-type.el")
  (bind-key (kbd "C-x C-r") 'insert-define-record-type)

  ;;; Key Bindings
  (global-set-key [C-tab] 'other-window)
  (global-set-key [C-S-tab] (lambda () (interactive) (other-window -1)))
  (define-key undo-tree-map [remap undo] nil)
  (bind-key (kbd "C-x C-y") 'yas-expand)
  (unbind-key (kbd "C-z") evil-emacs-state-map)
  (bind-key (kbd "C-z") 'undo)
  (bind-key (kbd "C-#") "@")
  (bind-key (kbd "C-+") "~")
  (bind-key (kbd "ö") "[")
  (bind-key (kbd "M-ö") "{")
  (bind-key (kbd "ä") "]")
  (bind-key (kbd "M-ä") "}")
  (bind-key (kbd "C-x C-b") 'ibuffer)
  (defun insert-backslash ()
    "insert backslash"
    (interactive)
    (insert "\\"))
  (bind-key (kbd "M-+") 'insert-backslash)
  (bind-key (kbd "M-*") "|")
  (bind-key (kbd "C-ö") 'join-line)
  (bind-key (kbd "C-q") 'previous-buffer)

  ;;; Umlaute
  (defun insert-oe ()
    "insert ö"
    (interactive)
    (insert "ö"))
  (defun insert-ae ()
    "insert ä"
    (interactive)
    (insert "ä"))
  (bind-key (kbd "C-M-ö") 'insert-oe)
  (bind-key (kbd "C-M-ä") 'insert-ae)

  ;;; Page Up and Down
  (bind-key (kbd "M-p") 'scroll-down-command)
  (bind-key (kbd "M-n") 'scroll-up-command)

  ;;; Timeclock Erweiterung
  (bind-key (kbd "C-x t i") 'timeclock-in)
  (bind-key (kbd "C-x t o") 'timeclock-out)
  (bind-key (kbd "C-x t c") 'timeclock-change)

  ;;; Für mehr Timeclock-Funktionalität
  (load-file "~/.elisp-files/kaan-timeclock.el")
  (bind-key (kbd "C-x t s") 'timeclock-sum-all-hours)
  (bind-key (kbd "C-x t t") 'timeclock-hours-worked-today)
  (bind-key (kbd "C-x t e") 'timeclock-hours-to-days-end)
  (bind-key (kbd "C-x t u") 'timeclock-overtime)
  (bind-key (kbd "C-x t w") 'timeclock-last-x-days-overtime)
  (bind-key (kbd "C-x t f") 'timeclock-open-timelog-file)

  ;; Um an Timeclock einen Kommentar zu hängen
  (load-file "~/.elisp-files/mikes-timeclock.el")
  (global-set-key (kbd "C-x t d") 'timeclock-provide-description)

  ;;; Ergänzung zu `other-window'
  (bind-key (kbd "C-c <left>")  'windmove-left)
  (bind-key (kbd "C-c <right>") 'windmove-right)
  (bind-key (kbd "C-c <up>")    'windmove-up)
  (bind-key (kbd "C-c <down>")  'windmove-down)

  ;;; For spelling use aspell instead of ispell
  (setq ispell-program-name "aspell")


  ;;; Rechtschreibkorrektur mit Langtool https://github.com/mhayashi1120/Emacs-langtool
  (setq langtool-language-tool-jar "~/langtool/LanguageTool-4.7/languagetool-commandline.jar")
  (require 'langtool)
  (bind-key (kbd "C-x l") 'langtool-check)
  (bind-key (kbd "C-x j") 'langtool-check-done)

  ;;; Mail mu4e --------------

  ;; Keybinding
  (bind-key (kbd "M-m M-m") 'mu4e)

  ;; Variables
  (setq mu4e-sent-folder "/activemail/Sent Messages"
        ;; mu4e-sent-messages-behavior 'delete ;; Unsure how this should be configured
        mu4e-trash-folder "/activemail/Trash"
        mu4e-drafts-folder "/activemail/drafts"
        user-mail-address "kaan.sahin@active-group.de"
        smtpmail-default-smtp-server "smtp.active-group.de"
        smtpmail-smtp-server "smtp.active-group.de"
        smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
        smtpmail-smtp-service 587
        mu4e-compose-signature
        "\nKaan Sahin\nActive Group GmbH\nkaan.sahin@active-group.de\n+49 7071 70896 80\n\nHechinger Straße 12/1, 72072 Tübingen\nRegistergericht: Amtsgericht Stuttgart, HRB 224404\nGeschäftsführer: Dr. Michael Sperber\n"
        smtpmail-smtp-user "sahin"
        smtpmail-local-domain "active-group.de"
        ;; um gesendete buffer zu killen
        message-kill-buffer-on-exit t

        ;; Flags nicht als Symbole
        mu4e-use-fancy-chars 'nil
        mu4e-get-mail-command "offlineimap -o -q"
        mu4e-update-interval 200
        mu4e-view-show-images t
        mu4e-view-show-addresses t)

  ;; Notifications
  (mu4e-alert-set-default-style 'notifications)
  (mu4e-alert-enable-notifications)
  (mu4e-alert-enable-mode-line-display)

  ;; Bookmarks
  (setq mu4e-bookmarks
        `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
          ("maildir:/activemail/INBOX" "Active Group INBOX" ?a)
          ("maildir:/activemail/eBike-Manager" "eBike-Manager" ?e)
          ("maildir:/activemail/BIMwelt" "BIMsystems" ?b)
          ("maildir:/activemail/\"Sent Messages\" " "Sent Messages" ?s)))

  ;; Mit `q` kann man mu4e ganz verlassen (erhält dann aber auch keine Mails mehr).
  ;; Deshalb überschreiben wir es mit `previous-buffer`.
  (eval-after-load 'mu4e
    '(define-key mu4e-main-mode-map (kbd "q") 'previous-buffer))

  ;;; Bei Reply oder Zitat die Zeile anpassen, dass auch Datum/Uhrzeit angezeigt wird
  (setq message-citation-line-function 'message-insert-formatted-citation-line)
  (setq message-citation-line-format "On %Y-%m-%d at %R %Z, %f wrote:\n")

  ;; Setze User-Mail-Adresse, um beim Antworten auf Mails die eigene Adresse
  ;; nicht im CC zu haben
  (setq mu4e-user-mail-address-list '("kaan.sahin@active-group.de"))

  ;;; Format flowed für E-Mails
  ;; format=flowed gesendete Nachrichten brechen optional nach X Zeichen um
  ;; Das ist insbesondere für mobile Geräte, wo die standardmäßigen 72 Zeichen
  ;; pro Zeile zu viel sind, sinnvoll, da sonst doppelt umgebrochen wird.

  ;; format=flowed unterstützen nicht alle Programme. Deshalb benutze ich einfach
  ;; harte Breaks. Ist auf mobilen Geräten nicht so schön, aber who cares. Dafuq
  (setq use-hard-newlines nil)
  (setq mu4e-compose-format-flowed nil)
  (setq fill-flowed-encode-column 72)

  ;; Falls eml Dateien drin sind die nicht gut lesbar sind (nicht öffnen kann)
  (setq mu4e-view-use-gnus t)

  ;; start mu4e
  (mu4e t)

  ;;; ----------------------

  ;;; org-babel language support
  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((clojure . t)
       (emacs-lisp . t)
       (haskell . t)
       (python . t)
       (latex . t)
       (plantuml . t)))
    )

  ;;; PlantUML
  (setq org-plantuml-jar-path
        (expand-file-name "~/.nix-profile/lib/plantuml.jar")

        plantuml-jar-path org-plantuml-jar-path
        plantuml-default-exec-mode 'jar
        plantuml-output-type "txt")

  ;;; Elixir settings
  (add-hook 'elixir-mode-hook
            (lambda ()
              (add-hook 'before-save-hook #'elixir-format t t)))


  ;; documentation popup timeout / delay
  (setq lsp-ui-doc-delay 2)

  (with-eval-after-load 'elixir-mode
    (spacemacs/declare-prefix-for-mode 'elixir-mode
      "mt" "tests" "testing related functionality")
    (spacemacs/set-leader-keys-for-major-mode 'elixir-mode
      "ta" 'exunit-verify-all
      "tb" 'exunit-verify
      "tr" 'exunit-rerun
      "tt" 'exunit-verify-single))

  

  (with-eval-after-load 'lsp-mode
    (setq lsp-restart 'auto-restart)
    (setq lsp-file-watch-threshold 25000)
    (push "[/\\]docker/temp$" lsp-file-watch-ignored)
    (push "temp$" lsp-file-watch-ignored))

  ;; Pin the exunit window to the bottom.
  ;; (push '("*exunit-compilation*"
  ;;         :dedicated t
  ;;         :position bottom
  ;;         :stick t
  ;;         :height 0.4
  ;;         :noselect t)
  ;;       popwin:special-display-config)

  ;;; OLD Elixir settings with alchemist
  ;; (with-eval-after-load 'elixir-mode
  ;;   (spacemacs/declare-prefix-for-mode 'elixir-mode
  ;;     "mt" "tests" "testing related functionality")
  ;;   (spacemacs/set-leader-keys-for-major-mode 'elixir-mode
  ;;     "tb" 'exunit-verify-all
  ;;     "ta" 'exunit-verify
  ;;     "tk" 'exunit-rerun
  ;;     "tt" 'exunit-verify-single
  ;;     "d" 'lsp-ui-doc-mode))

  ;;; Um Häufigkeit von Keybinding-Usage anzuzeigen
  (require 'keyfreq)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)

  (setq keyfreq-excluded-commands
        '(self-insert-command
          forward-char
          backward-char
          previous-line
          next-line
          ivy-next-line
          org-self-insert-command
          lsp-ui-doc--handle-mouse-movement
          ignore
          mwheel-scroll
          magit-next-line
          ivy-backward-delete-char
          delete-backward-char
          org-delete-backward-char
          delete-char
          mouse-drag-region
          new-line-and-indent
          ivy-done
          magit-previous-line
          ivy-previous-line))

  ;;; Damit kill-buffer ohne Confirmation direkt den Buffer killt:
  (global-set-key (kbd "C-x k") 'kill-this-buffer)

  ;; set region highlighting more visible (black)
  (custom-set-faces
   '(region ((t (:inherit highlight :background "#000000")))))


  ;; damit man Dateien über SSH öffnen kann
  (setq tramp-shell-prompt-pattern "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")






  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
  (defun dotspacemacs/emacs-custom-settings ()
    "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
    (custom-set-variables
     ;; custom-set-variables was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(ansi-color-faces-vector
       [default default default italic underline success warning error])
     '(custom-safe-themes
       (quote
        ("e6ccd0cc810aa6458391e95e4874942875252cd0342efd5a193de92bfbb6416b" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
     '(evil-want-Y-yank-to-eol nil)
     '(helm-ag-fuzzy-match t)
     '(line-number-mode nil)
     '(package-selected-packages
       (quote
        (doom-modeline shrink-path tern zenburn-theme zen-and-art-theme yasnippet-snippets yaml-mode xterm-color ws-butler writeroom-mode winum white-sand-theme which-key web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toxi-theme toc-org terminal-here tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection sql-indent spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slime-company slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme railscasts-theme racket-mode purple-haze-theme pug-mode professional-theme prettier-js popwin plantuml-mode planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el password-generator paradox overseer orgit organic-green-theme org-superstar org-re-reveal org-present org-pomodoro org-mime org-download org-cliplink org-brain open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir nodejs-repl noctilux-theme naquadah-theme nameless mvn mustang-theme multi-term mu4e-maildirs-extension mu4e-alert move-text monokai-theme monochrome-theme molokai-theme moe-theme modus-vivendi-theme modus-operandi-theme mmm-mode minimal-theme meghanada maven-test-mode material-theme markdown-toc majapahit-theme magit-svn magit-section magit-gitflow madhat2r-theme lush-theme lsp-ui lsp-java lsp-haskell lorem-ipsum livid-mode link-hint light-soap-theme langtool kaolin-themes json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme indent-guide impatient-mode hybrid-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mu helm-mode-manager helm-make helm-lsp helm-ls-git helm-hoogle helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme groovy-mode groovy-imports grandshell-theme gradle-mode gotham-theme google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geben gandalf-theme fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-haskell flycheck-elsa flycheck-credo flycheck-clj-kondo flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse exunit expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help emr emmet-mode elixir-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme dotenv-mode doom-themes django-theme diminish devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dante dakrone-theme cyberpunk-theme csv-mode company-web company-reftex company-phpactor company-php company-ghci company-ghc company-cabal company-auctex common-lisp-snippets column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk attrap apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ace-jump-helm-line ac-ispell)))
     '(safe-local-variable-values
       (quote
        ((eval define-clojure-indent
               (codepoint-case
                (quote defun)))
         (cider-cljs-default-repl . shadow)
         (cider-ns-refresh-after-fn . "integrant.repl/resume")
         (cider-ns-refresh-before-fn . "integrant.repl/suspend")
         (cider-cljs-lein-repl . "(do (start-cljs-repl) (cljs-repl))")
         (cider-refresh-after-fn . "integrant.repl/resume")
         (cider-refresh-before-fn . "integrant.repl/suspend"))))
     '(send-mail-function (quote smtpmail-send-it))
     '(tramp-verbose 10))
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(region ((t (:inherit highlight :background "#000000")))))
    ))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "e6ccd0cc810aa6458391e95e4874942875252cd0342efd5a193de92bfbb6416b" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "11e57648ab04915568e558b77541d0e94e69d09c9c54c06075938b6abc0189d8" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(helm-ag-fuzzy-match t)
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (doom-modeline shrink-path tern zenburn-theme zen-and-art-theme yasnippet-snippets yaml-mode xterm-color ws-butler writeroom-mode winum white-sand-theme which-key web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired toxi-theme toc-org terminal-here tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection sql-indent spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slime-company slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme railscasts-theme racket-mode purple-haze-theme pug-mode professional-theme prettier-js popwin plantuml-mode planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el password-generator paradox overseer orgit organic-green-theme org-superstar org-re-reveal org-present org-pomodoro org-mime org-download org-cliplink org-brain open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir nodejs-repl noctilux-theme naquadah-theme nameless mvn mustang-theme multi-term mu4e-maildirs-extension mu4e-alert move-text monokai-theme monochrome-theme molokai-theme moe-theme modus-vivendi-theme modus-operandi-theme mmm-mode minimal-theme meghanada maven-test-mode material-theme markdown-toc majapahit-theme magit-svn magit-section magit-gitflow madhat2r-theme lush-theme lsp-ui lsp-java lsp-haskell lorem-ipsum livid-mode link-hint light-soap-theme langtool kaolin-themes json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme indent-guide impatient-mode hybrid-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mu helm-mode-manager helm-make helm-lsp helm-ls-git helm-hoogle helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme groovy-mode groovy-imports grandshell-theme gradle-mode gotham-theme google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geben gandalf-theme fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-haskell flycheck-elsa flycheck-credo flycheck-clj-kondo flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse exunit expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help emr emmet-mode elixir-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme dotenv-mode doom-themes django-theme diminish devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dante dakrone-theme cyberpunk-theme csv-mode company-web company-reftex company-phpactor company-php company-ghci company-ghc company-cabal company-auctex common-lisp-snippets column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chocolate-theme cherry-blossom-theme centered-cursor-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk attrap apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((eval define-clojure-indent
           (codepoint-case
            (quote defun)))
     (cider-cljs-default-repl . shadow)
     (cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend")
     (cider-cljs-lein-repl . "(do (start-cljs-repl) (cljs-repl))")
     (cider-refresh-after-fn . "integrant.repl/resume")
     (cider-refresh-before-fn . "integrant.repl/suspend"))))
 '(send-mail-function (quote smtpmail-send-it))
 '(tramp-verbose 10))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:inherit highlight :background "#000000")))))
)
