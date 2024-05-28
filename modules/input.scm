(define-module (input)
  #:pure
  #:use-module (scheme base)
  #:use-module (scheme write)
  #:use-module (hoot ffi)
  #:use-module (dom event)
  #:use-module (math vector)
  #:export (on-key-down
            on-key-up 
            command:accelerate-forward
            command:accelerate-backward
            command:rotate-left
            command:rotate-right
            command:fire-missile))

(define key:up "ArrowUp")
(define key:down "ArrowDown")
(define key:left "ArrowLeft")
(define key:right "ArrowRight")
(define key:fire "KeyZ")

(define command:accelerate-forward #f)
(define command:accelerate-backward #f)
(define command:rotate-left #f)
(define command:rotate-right #f)
(define command:fire-missile #f)

(define (on-key-down event)
  (let ((key (keyboard-event-code event)))
    (cond ((string=? key key:left)  (set! command:rotate-left #t)) 
          ((string=? key key:right) (set! command:rotate-right #t)) 
          ((string=? key key:up)    (set! command:accelerate-forward #t))
          ((string=? key key:down)  (set! command:accelerate-backward #t))
          ((string=? key key:fire)  (set! command:fire-missile #t)))))

(define (on-key-up event)
  (let ((key (keyboard-event-code event)))
    (cond ((string=? key key:left)  (set! command:rotate-left #f)) 
          ((string=? key key:right) (set! command:rotate-right #f)) 
          ((string=? key key:up)    (set! command:accelerate-forward #f))
          ((string=? key key:down)  (set! command:accelerate-backward #f))
          ((string=? key key:fire)  (set! command:fire-missile #f)))))
