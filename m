Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pxh5NAxt3bEmoZj7t38v97LtvERBWNQDtkd0u7QSNqQ=;
 b=Bd9+IYphUs4eY/aOFzxwsInolX+vflhsnMGQrMylsgHIRydyk4m1MMDcErnom4Jujh
 nfzKQxPug9GP4AKUFGmsNxYPn92TYZAQdHiS2wvyCcRRj81qwibQzCOuUD8bUH25ecz2
 G+LEWkK4mYQLBCMEwBAlwRNwsQ3Ax2d4Bi8VD6khh9Bc/YHzf/7EL+BmHLvuEooOZrMe
 STgub5QWG+3ZV0mXx9OOKa5Ohd/DfAaZQOdLP1tXXBZTjHK+KnK8nE8GPRV6pgCdRMRq
 NaynI74fK+In85PzZnon04ZkvK42T/XhvbL0t189GjrpWy7vnm138QUHWURROwjuf+dW
 WuiA==
Subject: [PATCH 1/3] Import noindentafter.sty 0.2.2
References: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <aece4ef8-21c7-6531-05ea-77cf58e6fa25@gmail.com>
Date: Sat, 1 Sep 2018 09:13:50 +0900
MIME-Version: 1.0
In-Reply-To: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 40ceedb7e148dddaed13ece5ab94ad409101bdde Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 31 Aug 2018 20:16:23 +0900
Subject: [PATCH 1/3] Import noindentafter.sty 0.2.2

For those using TeX Live 2013/Debian on Ubuntu Trusty which has a
buggy version of noindentafter.sty (0.0.1), import the latest one.

"noindentafter" can be used to suppress indent right after section-
level epigraphs added in commit 87181d9e5d6a ("debugging: Add
section-level epigraphs").

NOTE: Trailing blanks are kept as they are.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 noindentafter.sty | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 189 insertions(+)
 create mode 100644 noindentafter.sty

diff --git a/noindentafter.sty b/noindentafter.sty
new file mode 100644
index 0000000..2ea6e22
--- /dev/null
+++ b/noindentafter.sty
@@ -0,0 +1,189 @@
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \iffalse %%%%
+%                                                                              %
+%  Copyright (c) 2014 - Michiel Helvensteijn - www.mhelvens.net                %
+%                                                                              %
+%  http://latex-noindentafter.googlecode.com                                   %
+%                                                                              %
+%  This work may be distributed and/or modified under the conditions           %
+%  of the LaTeX Project Public License, either version 1.3 of this             %
+%  license or (at your option) any later version. The latest version           %
+%  of this license is in     http://www.latex-project.org/lppl.txt             %
+%  and version 1.3 or later is part of all distributions of LaTeX              %
+%  version 2005/12/01 or later.                                                %
+%                                                                              %
+%  This work has the LPPL maintenance status `maintained'.                     %
+%                                                                              %
+%  The Current Maintainer of this work is Michiel Helvensteijn.                %
+%                                                                              %
+%  This work consists of the files noindentafter.tex and noindentafter.sty.    %
+%                                                                              %
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \fi %%%%
+
+% \CheckSum{50}
+%
+% \CharacterTable
+%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
+%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
+%   Digits        \0\1\2\3\4\5\6\7\8\9
+%   Exclamation   \!     Double quote  \"     Hash (number) \#
+%   Dollar        \$     Percent       \%     Ampersand     \&
+%   Acute accent  \'     Left paren    \(     Right paren   \)
+%   Asterisk      \*     Plus          \+     Comma         \,
+%   Minus         \-     Point         \.     Solidus       \/
+%   Colon         \:     Semicolon     \;     Less than     \<
+%   Equals        \=     Greater than  \>     Question mark \?
+%   Commercial at \@     Left bracket  \[     Backslash     \\
+%   Right bracket \]     Circumflex    \^     Underscore    \_
+%   Grave accent  \`     Left brace    \{     Vertical bar  \|
+%   Right brace   \}     Tilde         \~}
+
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+% \subsection{Package Info}                                                    %
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+%
+%    \begin{macrocode}
+\NeedsTeXFormat{LaTeX2e}
+\ProvidesPackage{noindentafter}[2014/11/30 0.2.2
+  prevent paragraph indentation after specific environments or macros]
+%    \end{macrocode}
+%
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+% \subsection{Packages}                                                        %
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+%
+%    \begin{macrocode}
+\RequirePackage{etoolbox}
+%    \end{macrocode}
+%
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+% \subsection{Patches}                                                         %
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+%%% \needspace{5\baselineskip}\begin{macro}{\end}
+%
+%  The package |etoolbox| provides the command
+%  |\AfterEndEnvironment| which creates a hook executed at a
+%  very late point inside the |\end| command. However, this
+%  hook is still located before |\ignorespaces|, which is
+%  too early to properly suppress the indention after an
+%  environment. Therefore another hook is now added to |\end|
+%  using |\patchcmd|. This new hook puts new code at the very
+%  end.
+%
+%    \begin{macrocode}
+\patchcmd\end{%
+  \if@ignore\@ignorefalse\ignorespaces\fi%
+}{%
+  \if@ignore\@ignorefalse\ignorespaces\fi%
+  \csuse{@noindent@#1@hook}%
+}{}{%
+  \PackageWarningNoLine{noindentafter}{%
+    Patching `\string\end' failed!\MessageBreak%
+    `\string\NoIndentAfter...' commands won't work%
+  }%
+}
+%    \end{macrocode}
+%
+%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+% \subsection{Macros}                                                          %
+%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+%%% \needspace{5\baselineskip}\begin{macro}{\@NoIndentAfter}
+%
+%  \noindent This command implements the main principle
+%  behind this package. It checks whether it is followed by
+%  a paragraph. If so, the command |\par| is temporarily
+%  changed using |\everypar|, so that the following paragraph
+%  is not indented. Immediately afterwards, default paragraph
+%  behavior is restored with |\@restorepar| (from the \LaTeX{}
+%  base).
+%
+%    \begin{macrocode}
+\newcommand*\@NoIndentAfter{%
+  \@ifnextchar\par{%
+    \def\par{%
+      \everypar{\setbox\z@\lastbox\everypar{}}%
+      \@restorepar%
+    }%
+  }{}%
+}
+%    \end{macrocode}
+%
+%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+%%% \needspace{5\baselineskip}\begin{macro}{\NoIndentAfterThis}
+%
+%  \noindent Enforce a paragraph break and suppress
+%  indentation for whatever follows.
+% 
+%    \begin{macrocode}
+\newrobustcmd*{\NoIndentAfterThis}{\@NoIndentAfter\par\par}
+%    \end{macrocode}
+% 
+%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+  % \needspace{5\baselineskip}\begin{macro}{\NoIndentAfterEnv}
+%%% \marg{environment}\\
+%
+%  \noindent Append |\@NoIndentAfter| to the output of
+%  \meta{environment} by using the new environment hook.
+% 
+%    \begin{macrocode}
+\newrobustcmd{\NoIndentAfterEnv}[1]{%
+  \csdef{@noindent@#1@hook}{\@NoIndentAfter}%
+}
+%    \end{macrocode}
+% 
+%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+  % \needspace{5\baselineskip}\begin{macro}{\NoIndentAfterCmd}
+%%% \marg{command}\\
+%
+%  \noindent Append |\NoIndentAfterThis| to the output of
+%  \meta{command}.
+% 
+%    \begin{macrocode}
+\newrobustcmd*{\NoIndentAfterCmd}[1]{%
+  \apptocmd{#1}{\NoIndentAfterThis}{}{%
+    \PackageWarning{noindentafter}{%
+      Patching `\string#1' failed!\MessageBreak%
+      `\string\NoIndentAfterCmd' won't work%
+    }%
+  }%
+}
+%    \end{macrocode}
+% 
+%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+
+
+
-- 
2.7.4


