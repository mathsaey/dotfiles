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

\ProcessOptions\relax

% ------------ %
% Beamer Setup %
% ------------ %

\LoadClass{beamer}

% Show a "preview" of \covered content.
% \visible will still hide an element completely
\setbeamercovered{transparent}

% Metropolis
% ----------

\RequirePackage{etex} % Needs to be loaded before metropolis to avoid warnings
\usetheme[progressbar=foot,block=fill]{metropolis}

% Avoid a vbox warning on title page
\def\titlepage{\usebeamertemplate{title page}}

% Don't show section slides
% -------------------------

\iftoggle{showsections}{}{%
  \AtBeginSection{}
}

% Presenter Notes Display
% -----------------------

% Show presenter nodes when this option is enabled.
% Use a viewer like dspdfviewer to properly display
% the resulting pdf.
\iftoggle{twoscreen}{%
  \RequirePackage{pgfpages}
  \setbeameroption{show notes on second screen}

  % Workaround for a xelatex bug
  % https://tex.stackexchange.com/questions/213053/text-is-white-coloured-after-beamer-note-pages-when-compiled-with-xelatex
  \makeatletter
  \def\beamer@framenotesbegin{
      \usebeamercolor[fg]{normal text}
      \gdef\beamer@noteitems{}
      \gdef\beamer@notes{}
  }
  \makeatother
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

\endinput
