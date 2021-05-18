Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E+zMS4GrNIRgM4xKW3qj4EXoiE2ADwzuXJl81nyY0n0=;
        b=ZRwyQh23rPAKzOhUqnJP+srtQsSiOFaBtjr6jrXxIe70isJZPjOeL2ynl6SJ27shn0
         /iosQxwQahG6Rc68nk6NQKjbHPvQvm70zNdmYLu8Rpi/rUZM36XiS9xiMCCjnaodcMvH
         Hv2hJhXHa+KCG3IvPbb4DEvxqR2wz4t1onpJ5UugMWZ4ElSdpMYr107Rr1h0vb9JDY+G
         h5Ajpc0nrIgwy+jj7QP6OuGztEUrttbucWEeWI1hRsk1XqUFS3i7laCkzlyLbOg3gvob
         6Tt2yFV9F8i7cGdcukhGlEvnQSHVLEm4JUMmiL3w/slEqxLFAwrB3fRJKpiqJZkQQ1vP
         MMEw==
Subject: [PATCH -perfbook 2/8] Omit noindentafter.sty
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d2f33581-dfa0-e168-87bd-3c79bd62ef41@gmail.com>
Date: Tue, 18 May 2021 21:19:14 +0900
MIME-Version: 1.0
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

noindentafter.sty was added to perfbook's repository for those
with old TeX Live packages such as the one on Ubuntu Trusty.

Now that we assume Ubuntu Bionic or later for build environment,
we can expect that it is available in the properly installed
TeX Live.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile          |   1 -
 noindentafter.sty | 194 ----------------------------------------------
 2 files changed, 195 deletions(-)
 delete mode 100644 noindentafter.sty

diff --git a/Makefile b/Makefile
index b23a7096..3dc7e12c 100644
--- a/Makefile
+++ b/Makefile
@@ -9,7 +9,6 @@ LATEXSOURCES = \
 	glossary.tex \
 	qqz.sty origpub.sty \
 	glsdict.tex indexsee.tex \
-	noindentafter.sty \
 	pfbook.cls \
 	ushyphex.tex pfhyphex.tex \
 	ack.tex \
diff --git a/noindentafter.sty b/noindentafter.sty
deleted file mode 100644
index 7a362248..00000000
--- a/noindentafter.sty
+++ /dev/null
@@ -1,194 +0,0 @@
-%% Notice to comply with Clause 6 of LPPL v 1.3c
-%% This file is copied from TeX Live 2015/Debian.
-%% Whole package including documentation can be obtained from:
-%%     https://ctan.org/pkg/noindentafter
-
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \iffalse %%%%
-%                                                                              %
-%  Copyright (c) 2014 - Michiel Helvensteijn - www.mhelvens.net                %
-%                                                                              %
-%  http://latex-noindentafter.googlecode.com                                   %
-%                                                                              %
-%  This work may be distributed and/or modified under the conditions           %
-%  of the LaTeX Project Public License, either version 1.3 of this             %
-%  license or (at your option) any later version. The latest version           %
-%  of this license is in     http://www.latex-project.org/lppl.txt             %
-%  and version 1.3 or later is part of all distributions of LaTeX              %
-%  version 2005/12/01 or later.                                                %
-%                                                                              %
-%  This work has the LPPL maintenance status `maintained'.                     %
-%                                                                              %
-%  The Current Maintainer of this work is Michiel Helvensteijn.                %
-%                                                                              %
-%  This work consists of the files noindentafter.tex and noindentafter.sty.    %
-%                                                                              %
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \fi %%%%
-
-% \CheckSum{50}
-%
-% \CharacterTable
-%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
-%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
-%   Digits        \0\1\2\3\4\5\6\7\8\9
-%   Exclamation   \!     Double quote  \"     Hash (number) \#
-%   Dollar        \$     Percent       \%     Ampersand     \&
-%   Acute accent  \'     Left paren    \(     Right paren   \)
-%   Asterisk      \*     Plus          \+     Comma         \,
-%   Minus         \-     Point         \.     Solidus       \/
-%   Colon         \:     Semicolon     \;     Less than     \<
-%   Equals        \=     Greater than  \>     Question mark \?
-%   Commercial at \@     Left bracket  \[     Backslash     \\
-%   Right bracket \]     Circumflex    \^     Underscore    \_
-%   Grave accent  \`     Left brace    \{     Vertical bar  \|
-%   Right brace   \}     Tilde         \~}
-
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-% \subsection{Package Info}                                                    %
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-%
-%    \begin{macrocode}
-\NeedsTeXFormat{LaTeX2e}
-\ProvidesPackage{noindentafter}[2014/11/30 0.2.2
-  prevent paragraph indentation after specific environments or macros]
-%    \end{macrocode}
-%
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-% \subsection{Packages}                                                        %
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-%
-%    \begin{macrocode}
-\RequirePackage{etoolbox}
-%    \end{macrocode}
-%
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-% \subsection{Patches}                                                         %
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-%%% \needspace{5\baselineskip}\begin{macro}{\end}
-%
-%  The package |etoolbox| provides the command
-%  |\AfterEndEnvironment| which creates a hook executed at a
-%  very late point inside the |\end| command. However, this
-%  hook is still located before |\ignorespaces|, which is
-%  too early to properly suppress the indention after an
-%  environment. Therefore another hook is now added to |\end|
-%  using |\patchcmd|. This new hook puts new code at the very
-%  end.
-%
-%    \begin{macrocode}
-\patchcmd\end{%
-  \if@ignore\@ignorefalse\ignorespaces\fi%
-}{%
-  \if@ignore\@ignorefalse\ignorespaces\fi%
-  \csuse{@noindent@#1@hook}%
-}{}{%
-  \PackageWarningNoLine{noindentafter}{%
-    Patching `\string\end' failed!\MessageBreak%
-    `\string\NoIndentAfter...' commands won't work%
-  }%
-}
-%    \end{macrocode}
-%
-%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-% \subsection{Macros}                                                          %
-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-%%% \needspace{5\baselineskip}\begin{macro}{\@NoIndentAfter}
-%
-%  \noindent This command implements the main principle
-%  behind this package. It checks whether it is followed by
-%  a paragraph. If so, the command |\par| is temporarily
-%  changed using |\everypar|, so that the following paragraph
-%  is not indented. Immediately afterwards, default paragraph
-%  behavior is restored with |\@restorepar| (from the \LaTeX{}
-%  base).
-%
-%    \begin{macrocode}
-\newcommand*\@NoIndentAfter{%
-  \@ifnextchar\par{%
-    \def\par{%
-      \everypar{\setbox\z@\lastbox\everypar{}}%
-      \@restorepar%
-    }%
-  }{}%
-}
-%    \end{macrocode}
-%
-%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-%%% \needspace{5\baselineskip}\begin{macro}{\NoIndentAfterThis}
-%
-%  \noindent Enforce a paragraph break and suppress
-%  indentation for whatever follows.
-% 
-%    \begin{macrocode}
-\newrobustcmd*{\NoIndentAfterThis}{\@NoIndentAfter\par\par}
-%    \end{macrocode}
-% 
-%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-  % \needspace{5\baselineskip}\begin{macro}{\NoIndentAfterEnv}
-%%% \marg{environment}\\
-%
-%  \noindent Append |\@NoIndentAfter| to the output of
-%  \meta{environment} by using the new environment hook.
-% 
-%    \begin{macrocode}
-\newrobustcmd{\NoIndentAfterEnv}[1]{%
-  \csdef{@noindent@#1@hook}{\@NoIndentAfter}%
-}
-%    \end{macrocode}
-% 
-%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-  % \needspace{5\baselineskip}\begin{macro}{\NoIndentAfterCmd}
-%%% \marg{command}\\
-%
-%  \noindent Append |\NoIndentAfterThis| to the output of
-%  \meta{command}.
-% 
-%    \begin{macrocode}
-\newrobustcmd*{\NoIndentAfterCmd}[1]{%
-  \apptocmd{#1}{\NoIndentAfterThis}{}{%
-    \PackageWarning{noindentafter}{%
-      Patching `\string#1' failed!\MessageBreak%
-      `\string\NoIndentAfterCmd' won't work%
-    }%
-  }%
-}
-%    \end{macrocode}
-% 
-%\end{macro}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-
-
-
-- 
2.17.1


