;;;  package --- Summary
;;; Commentary:
;;; Code:
;; 不太明白，下面的语句已经起作用了，但是插件并没有起作用，命令无法使用
;; 暂时放弃了，以后请教大神。。。
;;原来prelude-require-package只是安装包，还需要require进来才能用 2016/01/12 13:32:11
;;(prelude-require-package 'chinese-fonts-setup)
(prelude-require-package 'chinese-pyim)
;; 下面是chinese-pyim的配置
(require 'chinese-pyim)
(setq pyim-use-tooltip nil)
(setq default-input-method "chinese-pyim")
;;切换输入法,输入全角/半角标点
(global-set-key (kbd "C-\\") 'toggle-input-method)
(global-set-key (kbd "C-;") 'pyim-toggle-full-width-punctuation)

;; 以下是erc的一些配置
(defun zhheng-irc ()
  "Connect to IRC."
  (interactive)
  (let
      ((password-cache nil))
      (erc :server "irc.freenode.net"
           :port 6667
           :nick "zh2683"
           :password (password-read (format "PassWord:"))
         )))

;; freenode.net上的一些火的频道 ##javascript  #python  #git  #emacs  ##java
;; 自动加入到一个server上的某一些频道
;; (setq erc-autojoin-channels-alist '(("freenode.net" "##java" "#emacs" "##javascript" "#python")))
(setq erc-ignore-list nil)
(setq erc-hide-list
      '("JOIN" "PART" "QUIT" "MODE"))

	  
;;设置tab键编辑的时候长度
(setq-default tab-width 4)


(provide 'chinese-zhheng)

;;; chinese-zhheng.el ends here
