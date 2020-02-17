(global-set-key "C-cnmc" 'nomicmu-mode-start-world-building-dialog)
(global-set-key "C-cnmk" 'nomicmu-mode-stop-world-building-dialog)

(defun nomicmu-mode-start-world-building-dialog ()
 ""
 (interactive)
 ())

(defun nomicmu-mode-stop-world-building-dialog ()
 ""
 (interactive)
 ())

(defun nomicmu-mode-navigate-to-object-and-edit-its-text (&optional tmp-object)
 ""
 (interactive)
 (let* ((object (or tmp-object
		 (nomicmu-mode-get-object-completing-read)))
	(text (nomicmu-mode-get-text-for-object object)))
  ))
