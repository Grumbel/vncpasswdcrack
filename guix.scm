;; vncpasswdcrack
;; Copyright (C) 2019 Ingo Ruhnke <grumbel@gmail.com>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(use-modules (guix build-system cmake)
             (guix gexp)
             (guix git-download)
             (guix licenses)
             (guix packages))

(define %source-dir (dirname (current-filename)))

(define-public vncpasswdcrack
  (package
   (name "vncpasswdcrack")
   (version "0.1.0")
   (source (local-file %source-dir
                       #:recursive? #t
                       #:select? (git-predicate %source-dir)))
   (build-system cmake-build-system)
   (arguments
    `(#:tests? #f))
   (synopsis "Deobfuscation tool for ~/.vnc/passwd")
   (description "Deobfuscation tool for ~/.vnc/passwd")
   (home-page "https://github.com/Grumbel/vncpasswdcrack")
   (license gpl2+)))

vncpasswdcrack

;; EOF ;;
