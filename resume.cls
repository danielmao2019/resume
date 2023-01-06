%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2022/09/15 v3.0 Resume class]

\LoadClass[10pt, letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{hyperref}
\usepackage{fontawesome}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \phone #1 { \def\@phone{#1} }
\def \@phone {\faPhone\ (519) 729-4955}

\def \email #1 { \def\@email{#1} }
\def \@email {\href{mailto:d6mao@uwaterloo.ca}{\faEnvelopeO\ daniel.mao@uwaterloo.ca}}

\def \linkedin #1 { \def\@linkedin{#1} }
\def \@linkedin {\href{https://www.linkedin.com/in/daniel-mao-a1895420a/}{\faLinkedin\ LinkedIn}}

\def \website #1 { \def\@website{#1} }
\def \@website {\href{https://student.cs.uwaterloo.ca/~d6mao/}{\faGlobe\ WebSite}}

\def \github #1 { \def\@github{#1} }
\def \@github {\href{https://github.com/danielmao2019}{\faGithub\ GitHub}}

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
    \@ifundefined{@addresstwo}{
        \def \@addresstwo {#1}
    }{
    \@ifundefined{@addressthree}{
    \def \@addressthree {#1}
    }{
        \def \@addressone {#1}
    }}
}

% % \printname is used to print the name as a page header
% \def \printname {
%     \begingroup
%         \hfil{\MakeUppercase{}}\hfil
%         \nameskip\break
%     \endgroup
% }

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
    \begingroup
        \def \\ {\addressSep\ }
        \centerline{#1}
    \endgroup
    \par
    \addressskip
}

\def\printinfo
{
    \begin{tabular}{lcr}
        \namesize\bf DAYOU MAO & \hspace*{0.9cm} & \@phone \; \@email \\
        4B Computer Science Student @ University of Waterloo & \hspace*{\fill} &
        \@github \hspace*{0.4cm} \@linkedin \hspace*{0.4cm} \@website
    \end{tabular}
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
    \ori@document  % Begin document
    \printinfo
    % \@ifundefined{@addressone}{}{ % Print the first address if specified
    %     \printaddress{\@addressone}}
    % \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    %     \printaddress{\@addresstwo}}
    % \@ifundefined{@addressthree}{}{ % Print the third address if specified
    %     \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
    \sectionskip
    \MakeUppercase{\bf #1} % Section title
    \sectionlineskip
    \hrule % Horizontal line
    \begin{list}{}{ % List for each individual item in the section
        \setlength{\leftmargin}{0.9em} % Margin within the section
    }
    \item[]
}{
    \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]
{ % 4 input arguments - company name, year(s) employed, job title and location
    {\bf #1} \hfill {#2} % Bold company name and date on the right
    \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
    \\
    {\em #3} \hfill {\em #4} % Italic job title and location
    }\smallskip
    \begin{itemize} % \cdot used for bullets, no indentation
    \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
}
{
    \end{itemize}
    \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\Huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
