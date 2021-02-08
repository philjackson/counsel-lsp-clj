;;; counsel-lsp-clj.el --- List refactoring fns that lsp-clojure provides.

;; Copyright (C) 2021 Phil Jackson

;; Author: Phil Jackson <phil@shellarchive.co.uk>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;; List refactoring fns that lsp-clojure provides.

;;; Code:

(require 'lsp-clojure)

(defconst refactorings
  '(lsp-clojure-add-import-to-namespace
    lsp-clojure-add-missing-libspec
    lsp-clojure-clean-ns
    lsp-clojure-cycle-coll
    lsp-clojure-cycle-privacy
    lsp-clojure-expand-let
    lsp-clojure-extract-function
    lsp-clojure-inline-symbol
    lsp-clojure-introduce-let
    lsp-clojure-move-to-let
    lsp-clojure-thread-first
    lsp-clojure-thread-first-all
    lsp-clojure-thread-last
    lsp-clojure-thread-last-all
    lsp-clojure-unwind-all
    lsp-clojure-unwind-thread))

(defun counsel-lsp-clj()
  "List refactoring fns that lsp-clojure provides."
  (interactive)
  (ivy-read "Refactoring: "
            (mapcar (lambda (s)
                      (cons
                       (format "%-23s: %s"
                               (replace-regexp-in-string "lsp-clojure-" "" (symbol-name s))
                               (elisp--docstring-first-line (documentation s)))
                            s))
                    refactorings)
            :require-match t
            :action (lambda (m) (call-interactively (cdr m)))))

(provide 'counsel-lsp-clj)
;;; counsel-lsp-clj.el ends here
