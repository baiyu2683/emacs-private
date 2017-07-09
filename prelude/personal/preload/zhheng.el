;;; package --- Summary
;;; Commentary:
;; prelude有默认全屏的快捷键，f11，因此一下不再需要了
;; 另外f12表示开启或者关闭菜单栏
;; 默认启动时最大化窗口
;; (defun w32-restore-frame ()
;;     "Restore a minimized frame"
;;      (interactive)
;;      (w32-send-sys-command 61728))
;; (defun w32-maximize-frame ()
;;     "Maximize the current frame"
;;      (interactive)
;;      (w32-send-sys-command 61488))
;; (w32-maximize-frame)

(when window-system (set-frame-size (selected-frame) 90 29))
;;下面是一种
;;1、保存文件用utf-8编码
;;2、python在shell中运行时中文不会出乱码
;;的一种尝试
;; 我勒个擦，居然成功了，就用它了居然成功了，就用它了
;; 貌似直接用emacs自带的buffer保存文件还是ansi的，需要新建文件才可以
;;; Code:
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'euc-cn)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'euc-cn)
(set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(euc-cn . euc-cn))




(setq-default pathname-coding-system 'utf-8)
;;以下为字体设置 中文用楷体，英文用Console 14
(set-face-attribute 
  'default nil :font "Consolas 12")
(dolist (character '(han kana symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
     character
     (font-spec :family "楷体")))



;; org-mode中加入几种状态 C-c C-t可以选择 ，叹号表示嵌入时间,@表示需要写说明
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "NEXT(n!)" "SOMEDAY(s!)" "HANGUP(h@/!)" "|" "DONE(d@/!)" "CANCEL(c@/!)")))

;; 下面这一行暂时不起作用，原因不知
;; (auto-image-file-mode)
;;显示行号，字体放大超过某个界限会被工具条挡住。。。坑
;; (global-linum-mode t)

;; 下面的配置是显示时间的
;;设置时间显示为24小时制
(setq display-time-24hr-format t)
;;显示时间的格式---貌似被遮住了，取消
;;(setq display-time-format "%A%H:%M")
;; 启用时间显示
(display-time-mode 1)

;; 下面的设置是为了插入时间和日期的，
;; Emacs自带的"C-c ." 貌似只能插入日期
;;insert-current-date
;;(defun insert-current-date ()
;;    "Insert the current date"
;;    (interactive "*")
;;    ;(insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
;;    (insert (format-time-string "%Y-%m-%d" (current-time))))
;;    (global-set-key "\C-xd" 'insert-current-date)

;;insert-current-time
(defun insert-current-time ()
  "Insert the current time"
  (interactive "*")
  (insert (format-time-string "[%Y年%m月%d日 %A]" (current-time))))
;;  (insert (format-time-string "[%Y年%m月%d日 %A %H:%M:%S]" (current-time))))
;; (insert (format-time-string "%H:%M:%S" (current-time))))
(global-set-key "\C-xt" 'insert-current-time)

(provide 'zhheng)
;;; zhheng.el ends here
