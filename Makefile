# Extremely simple yet useful Makefile

# make cv compiles the CVs
cv_file_en=cv-lpkatsikas-en
cv_file_gr=cv-lpkatsikas-gr
short_cv_file_en=cv-short-lpkatsikas-en
short_cv_file_gr=cv-short-lpkatsikas-gr

cv:
	lualatex "\def\SHORT{0} \input{$(cv_file_en)}"
	lualatex "\def\SHORT{0} \input{$(cv_file_gr)}"
	lualatex "\def\SHORT{1} \input{$(short_cv_file_en)}"
	lualatex "\def\SHORT{1} \input{$(short_cv_file_gr)}"
	rm -f *.aux
	rm -f *.out
	rm -f *.bbl
	rm -f *.log

clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.log
	rm -f *.out
	rm -f *.pdf
	rm -f .fuse*
