\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

\RequirePackage{fontawesome}
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{808080}
\definecolor{pblue}{HTML}{0395DE}

\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{test}{HTML}{0077be}
\definecolor{yt}{HTML}{c71610}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

%\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

\pagestyle{empty}           % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm}  % Top margin

\usepackage{fix-cm}

\makeatletter
\newcommand\HUGE{\@setfontsize\Huge{30}{30}}
\newcommand\HUGETWO{\@setfontsize\Huge{23}{23}}
\newcommand\HUGETHREE{\@setfontsize\Huge{22}{22}}
\makeatother

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{4cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvmailb}[1]{\renewcommand{\cvmailb}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvtype}[1]{\renewcommand{\cvtype}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvtechskills}[1]{\renewcommand{\cvtechskills}{#1}}
\newcommand{\cvtechoverview}[1]{\renewcommand{\cvtechoverview}{#1}}
\newcommand{\cvtechlang}[1]{\renewcommand{\cvtechlang}{#1}}
\newcommand{\cvtechlangnote}[1]{\renewcommand{\cvtechlangnote}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

% Command for printing languages progress bars
\newcommand\languages[1]{ 
	\renewcommand{\languages}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

% Command for visualizing technical skills
\newcommand\techskills[1]{
	\renewcommand{\techskills}{
		#1
	}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5.0cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
		\begin{center}
			\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
				%\clip (600/2, 567/2) circle (567/2);
				\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {%
					\includegraphics[width=\imagewidth]{\profilepic}
				};
			\end{tikzpicture}
		\end{center}

		%------------------------------------------------

		{\huge\color{mainblue}\cvtype}

		%------------------------------------------------

		{\huge\color{mainblue}\cvname}

		%------------------------------------------------

		{\Large\color{black!80}\cvjobtitle}

		%------------------------------------------------

		% More fontawesome icons here:
		% ftp://ftp.dante.de/tex-archive/fonts/fontawesome/doc/fontawesome.pdf

		\renewcommand{\arraystretch}{1.7}
		\begin{tabular}{p{1cm} @{\hskip 0.5cm}p{5cm}}
			% \ifthenelse{\equal{\cvdate}{}}{}{\textsc{\Large\icon{\Info}} & \cvdate\\}
			% \ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\Large\icon{\Letter}} & \cvaddress\\}
			% \ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
			% \ifthenelse{\equal{\cvsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \cvsite\\}
			% \ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{@}} & \cvmail \\}
			\ifthenelse{\equal{\cvdate}{}}{}{
				{$
					\begin{array}{l}
						\hspace{0.3mm} \vspace{-0.5em} \HUGETHREE \textnormal{\faInfoCircle}
					\end{array}
				$} & \cvdate\\
			}
			\ifthenelse{\equal{\cvaddress}{}}{}{
				{$
					\begin{array}{l}
						\hspace{1mm} \vspace{-1.3em} \HUGETWO \textnormal{\textcolor{yt}{\faMapMarker}}
					\end{array}
				$} & \cvaddress\\
			}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{
				{$
					\begin{array}{l}
						\hspace{1.0mm} \vspace{-0.25em} \HUGE \textnormal{\faMobilePhone}
					\end{array}
				$} & \cvnumberphone\\
			}
			% \ifthenelse{\equal{\href{\cvsite}{\cvsite}}{}}{}{
			% 	{$
			% 		\begin{array}{l}
			% 			\hspace{0.1mm} \vspace{-0.20em} \huge \textnormal{\textcolor{test}{\faGlobe}}
			% 		\end{array}
			% 	$} & \href{http://\cvsite}{\cvsite} \\
			% }
			\ifthenelse{\equal{\cvmail}{}}{}{
				{$
					\begin{array}{l}
						\hspace{-0.3mm} \vspace{-0.12em} \huge \textnormal{\textcolor{yt}{\faEnvelopeO}}
					\end{array}
				$} & \href{mailto:\cvmail}{\cvmail} \\
			}
			\ifthenelse{\equal{\cvmailb}{}}{}{
				{$
					\begin{array}{l}
						\hspace{-0.3mm} \vspace{-0.12em} \huge \textnormal{\textcolor{yt}{}}
					\end{array}
				$} & \href{mailto:\cvmailb}{\cvmailb} \\
			}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{
				{$
					\begin{array}{l}
						\hspace{0mm} \huge \textnormal{\textcolor{linkedin}{\faLinkedin}}
					\end{array}
				$} & \href{https://www.linkedin.com\cvlinkedin}{\cvlinkedin} \\
			}
			% \ifthenelse{\equal{\cvgithub}{}}{}{
			% 	{$
			% 		\begin{array}{l}
			% 			\hspace{0mm} \huge \textnormal{\faGithub}
			% 		\end{array}
			% 	$} & \href{https://www.github.com/\cvgithub}{\cvgithub}
			% }
		\end{tabular}

		%------------------------------------------------

		%\profilesection{About me}{2.6cm}
			
		%\begin{flushleft}
		%	\aboutme
		%\end{flushleft}

		%------------------------------------------------

		\vspace{-0.3em}

		\cvtechskills

		\cvtechoverview

		\vspace{-0.4em}

		\techskills

		\vspace{-1.2em}

		\cvtechlang

		\vspace{-0.6em}

		\skills
		\scriptsize
		\cvtechlangnote
			
		%------------------------------------------------

	%	\profilesection{Languages}{2.3cm}

	%	\languages
			
		%------------------------------------------------
			
	\end{textblock}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\else%
			maingray\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[4]{%
	#1&\parbox[t]{0.90\textwidth}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}%
	}\\
}

\newcommand{\twentyplusitem}[6]{%
	#1&\parbox[t]{0.85\textwidth}{%
		\textbf{#3}%
		\hfill%
		{\footnotesize#4}%
        }\\%
    #2&\parbox[t]{0.85\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage{hyperref}

\usepackage{smartdiagram}
\smartdiagramset{
	bubble center node font = \footnotesize,
	bubble node font = \footnotesize,
	% specifies the minimum size of the bubble center node
	bubble center node size = 0.5cm,
	%  specifies the minimum size of the bubbles
	bubble node size = 0.5cm,
	% specifies which is the distance among the bubble center node and the other bubbles
	distance center/other bubbles = 0.5cm,
	% sets the distance from the text to the border of the bubble center node
	distance text center bubble = 0.5cm,
	% set center bubble color
	bubble center node color = pblue,
	% define the list of colors usable in the diagram
	set color list = {materialamber, materialcyan, orange, green, materialorange, lightgray, materialteal, materialindigo, materialgreen, materiallime},
	% sets the opacity at which the bubbles are shown
	bubble fill opacity = 0.6,
	% sets the opacity at which the bubble text is shown
	bubble text opacity = 1,
}
