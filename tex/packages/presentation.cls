% ----------------------------------------------------------------------------
% presentation.cls
% Mathijs Saey
% LaTeX Class to create beamer presentations
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[2018/12/01]
\ProvidesPackage{presentation}

% ----------------------------------------------------------------------------
% This class sets up my personal presentation environment in latex, through
% the use of beamer. The Metropolis theme (https://github.com/matze/mtheme) is
% used to obtain a modern look. To function properly, the Fira Sans (Mozilla)
% font should be installed and XeLaTex should be used.
%
% A few arguments can be passed to this class to obtain different outputs:
% - twoscreen : Generate a pdf with presenter notes. The notes can be shown on
%               a second screen through the use of a pdf viewer which supports
%               dual screen pdfs, such as dspdfviewer. Disabled by default.
% - showsections : Show slides for every section. Disabled by default.
% - handout : Create a handout with presenter notes included. Disabled by
%             default.
% When no option is provided, a pdf of the slides without presenter notes is
% generated.
% ----------------------------------------------------------------------------

\RequirePackage{etex} % Needs to be loaded before beamer to avoid warnings
\RequirePackage{etoolbox}  % Toggle

% ------- %
% Options %
% ------- %

\DeclareRobustCommand{\option}[2][]{%
  \newtoggle{#2}
  \DeclareOption{#2}{\toggletrue{#2}#1}
  \DeclareOption{no#2}{\togglefalse{#2}}
}

\option{twoscreen}
\option{showsections}
\option[\PassOptionsToClass{\CurrentOption}{beamer}]{handout}

\ExecuteOptions{notwoscreen,noshowsections,nohandout}
\ProcessOptions*

% ------------ %
% Beamer Setup %
% ------------ %

% Needed to fix a xetex bug. The framenotesbegin workaround causes issues with
% standout frames, so use this workaround instead.
%   https://github.com/matze/mtheme/issues/191#issuecomment-258044147
\def\pgfsysdriver{pgfsys-dvipdfm.def}

\LoadClass{beamer}

% Show a "preview" of \covered content.
% \visible will still hide an element completely
\setbeamercovered{transparent}

% Metropolis
% ----------

\usetheme[progressbar=foot,block=fill]{metropolis}

% Avoid a vbox warning on title page
\def\titlepage{\usebeamertemplate{title page}}

% Extra Packages
% --------------
% Loaded after beamer/metropolis to avoid issues

\RequirePackage{tikz}
\RequirePackage{booktabs}

% Tikz libraries
\usetikzlibrary[positioning]

% Appendix
% --------

% Ensure progress bar stops before appendix
\RequirePackage{appendixnumberbeamer}
% Avoid a hyperref warning when using appendix
\renewcommand{\appendixname}{\texorpdfstring{\translate{Appendix}}{Appendix}}

% Display math spacing
% --------------------

\DeclareRobustCommand{\@setskip}{%
  \setlength{\abovedisplayskip}{0.2\abovedisplayskip}
  \setlength{\belowdisplayskip}{0.2\belowdisplayskip}
  \setlength{\abovedisplayshortskip}{0.2\abovedisplayshortskip}
  \setlength{\belowdisplayshortskip}{0.2\belowdisplayshortskip}
}

% Reduce spacing of display math in blocks
\addtobeamertemplate{block begin}{\@setskip}{}
\addtobeamertemplate{block example begin}{\@setskip}{}
\addtobeamertemplate{block alerted begin}{\@setskip}{}

% Don't show section slides
% -------------------------

\iftoggle{showsections}{%
  \metroset{sectionpage=progressbar,subsectionpage=none}
}{%
  \metroset{sectionpage=none,subsectionpage=none}
}

% Presenter Notes Display
% -----------------------

% Show presenter nodes when this option is enabled.
% Use a viewer like dspdfviewer to properly display
% the resulting pdf.
\iftoggle{twoscreen}{%
  \RequirePackage{pgfpages}
  \setbeameroption{show notes on second screen}
}

% Handouts
% --------

\iftoggle{handout}{%
  % Remove fluff
  \metroset{progressbar=none}

  % 2 slides per page
  \RequirePackage{pgfpages}
  \pgfpagesuselayout{6 on 1}[a4paper,border shrink=5mm]

  % Show notes
  \setbeameroption{show notes}
  \setbeamertemplate{note page}{\insertnote}

  % Create a blank note page when no notes are present
  % https://tex.stackexchange.com/questions/11708/run-macro-on-each-frame-in-beamer/11724#11724
  \makeatletter
  \def\beamer@framenotesbegin{
    \gdef\beamer@noteitems{}%
    \gdef\beamer@notes{{}}
  }
  \makeatother
}

% ------ %
% Macros %
% ------ %

\DeclareRobustCommand{\righttext}[1]{\hspace*{\fill}#1}

\DeclareRobustCommand{\taggedtext}[2]{#1: \righttext{\textsc{(#2)}}}
\DeclareRobustCommand{\suchthat}[1]{\taggedtext{Such that}{#1}}
\DeclareRobustCommand{\taggedand}[1]{\taggedtext{And}{#1}}

\DeclareRobustCommand{\subtle}[1]{\textcolor{gray}{#1}}

% Notes
% -----

\let\oldnote\note%
\DeclareRobustCommand{\note}[1]{\oldnote[item]{#1}}

\DeclareRobustCommand{\todo}[1]{\note{\textbf{Todo:} #1}}
\DeclareRobustCommand{\recap}[1]{\note{\textbf{Recap:} #1}}
\DeclareRobustCommand{\discuss}[1]{\note{\textbf{Feedback:} #1}}
\DeclareRobustCommand{\notation}[1]{\note{\textbf{Notation:} #1}}

% Inline Graphics
% ---------------

\newlength{\ilgfxheight}
\newlength{\ilgfxdepth}

\DeclareRobustCommand*\inlinegraphics[1]{%
  \settototalheight{\ilgfxheight}{logo skitter}%
  \settodepth{\ilgfxdepth}{logo skitter}%
  \raisebox{-\ilgfxdepth}{\includegraphics[height=\ilgfxheight]{#1}}%
}

% Markers
% -------

% http://www.texample.net/tikz/examples/global-nodes/
% Add macro to draw between nodes?

% https://tex.stackexchange.com/questions/42800/global-variables-for-all-tikz-drawings-in-a-document
% Come up with global tikz style

\DeclareRobustCommand{\markm}[3][]{\mark[#1]{#2}{\ensuremath{#3}}}
\DeclareRobustCommand{\mark}[3][]{%
  \tikz{%
    \node[fill=#2!30] (#1) {#3};
  }
}

\endinput
