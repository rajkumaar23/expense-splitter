#lang racket
(require dyoo-while-loop)
(define users (make-hash))
(define events (make-hash))
(define expenses '())

 

(define (clear_data)
  (set! expenses '())
  (hash-clear! users)
  (hash-clear! events)
  )

 

(define (read_users)
  (display "Enter total number of people : ")
  (newline)
  (define no_ppl(read))
   
  (for ([i no_ppl])
    (display  (string-append "Enter name of person ID : " (~v i)))
    (newline)
    (define username (read))
    (hash-set! users i username)
    )
  users)

 

(define (read_events)
  (display "Enter total number of events : ")
  (newline)
  (define no_event(read))
   
  (for ([i no_event])
    (display  (string-append "Enter name of event : " (~v i)))
    (newline)
    (define event_name (read))
    (hash-set! events i event_name)
    )
  events)

 

(define (read_expenses)
  (while #t
         (display "Enter user ID : ")
         (newline)
         (define u_id (read))
         (display "Enter event ID : ")
         (newline)
         (define e_id (read))
         (display "Enter amount spent : ")
         (newline)
         (define amount (read))
         (display "Do you want to continue ? ")
         (define ch (read-line))
         (define input (read-line))
         (set! expenses (append expenses (list (list u_id e_id amount))))
         (unless (regexp-match #px"yes" input)
           (break))
         )
  expenses
  )
(define (calc_expenses)
  (define sum 0)
  (for ([i (length expenses)])
   (set! sum (+ sum (caddr (list-ref expenses i))))
    )
  (display "Total amount of expenses is Rs.")
  (display sum)
  (define no-of-users 0)
  (for ([value (in-hash-values users)])
    (set! no-of-users (+ no-of-users 1))
  )
  (define per-head (/ sum no-of-users))
  (newline)
  (display "Expense per head is Rs.")
  (display per-head)
  sum
 )
  
(define (main)
  (display (read_users))
  (newline)
  (display(read_events))
  (newline)
  (display(read_expenses))
  (newline)
  (calc_expenses)
  (clear_data)
  )