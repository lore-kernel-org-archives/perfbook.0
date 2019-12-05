Return-Path: <SRS0=ldQa=Z3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6J9HRjq6WK3A3cDTfGXKOXr5jg4HkiQOl+LTuAzUpcI=;
        b=q7T1cQDxY/Ur/fKu/BUtpG+FJIgnDRlRMntmlhrVPBYUzZjWqa+jqPVJTJTEqH6Q6V
         k+d0iR35oqh6B8EKHcik3gTJgOk2fr9mZ7QGGw5IPaQiXE4zuVcxW3sre9gwUEvFSgya
         Z/7lm1aui0auxAuj/b04E6zsw1Fsltzm/wJggnovzaEC5FQguzDvnZ22mJTeL6ESt9uK
         kywpQ5t3nOyzIgOLxB/eC2k5b4KIAqSmztDu+I8x03q6pHjDoKh2R0mfty5F9XDe66zf
         RSfI5ye7f/uu2ENMeGMivmq7kTl2e9p3KfyYbUAiyZiOZyMdtbivCN31jlW4wO7itoIH
         viwg==
Subject: [PATCH 3/3] styleguide: Update on cross-reference and endash
References: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3fc17854-c4bf-6082-190b-37ccb7455a1d@gmail.com>
Date: Fri, 6 Dec 2019 00:19:18 +0900
MIME-Version: 1.0
In-Reply-To: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b562f538196efde9f751e85d1edcb87fa3074a6e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 5 Dec 2019 21:26:16 +0900
Subject: [PATCH 3/3] styleguide: Update on cross-reference and endash

Also wordsmith the footnote on \verb command.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 92 ++++++++++++++++++++++++------
 1 file changed, 73 insertions(+), 19 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index b9a2f891..9c415802 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -771,14 +771,73 @@ On the other hand, \verb|\tco{}| can not handle
 ``\co{\%}'', ``\co{\{}'', ``\co{\}}'', nor ``\co{\\}'' properly.
 If they are escaped by a~``\co{\\}'',
 they appear in the end result with the escape character.
-The \qco{\verb} macro can be used in running text if you
+The \qco{\verb} command can be used in running text if you
 need to use monospace font for a string which contains
 many characters to escape.\VerbatimFootnotes\footnote{
-  \verb|\verb| macro is not almighty though. For example, you can't
-  use it within a footnote. If you do so, you will see a fatal \LaTeX\ error.
+  The \verb|\verb| command is not almighty though.
+  For example, you can't use it within a footnote.
+  If you do so, you will see a fatal \LaTeX\ error.
   The \qco{fancyvrb} package provides a workaround by
-  the name of \verb|\VerbatimFootnotes| macro. This footnote
-  contains \verb|\verb| macro.}
+  the name of \verb|\VerbatimFootnotes| macro.
+  This footnote is an example which contains a few \verb|\verb|
+  commands.}
+
+\subsection{Cross-reference}
+\label{sec:app:styleguide:Cross-Reference}
+
+Cross-references to \namecrefs{chp:Introduction},
+\namecrefs{sec:intro:Parallel Programming Goals},
+\namecrefs{lst:app:styleguide:Source of Code Sample}, etc. have
+been expressed by combinations of names and bare \verb|\ref{}|
+commands in the following way:
+
+\begin{VerbatimN}
+Chapter~\ref{chp:Introduction},
+Table~\ref{tab:app:styleguide:Digit-Grouping Style}
+\end{VerbatimN}
+
+This is a traditional way of cross\-/referencing.
+However, it is tedious and sometimes error-prone to put a name
+manually on every cross\-/reference.
+The \co{cleveref} package provides a nicer way of cross\-/referencing.
+A few examples follow:
+
+\begin{VerbatimN}
+\Cref{chp:Introduction},
+\cref{sec:intro:Parallel Programming Goals},
+\cref{chp:app:styleguide:Style Guide},
+\cref{tab:app:styleguide:Digit-Grouping Style}, and
+\cref{lst:app:styleguide:Source of Code Sample} are
+examples of cross\-/references.
+\end{VerbatimN}
+
+Above code is typeset as follows:
+
+\begin{quote}
+\Cref{chp:Introduction},
+\cref{sec:intro:Parallel Programming Goals},
+\cref{chp:app:styleguide:Style Guide},
+\cref{tab:app:styleguide:Digit-Grouping Style}, and
+\cref{lst:app:styleguide:Source of Code Sample} are
+examples of cross\-/references.
+\end{quote}
+
+As you can see, naming of cross\-/references is automated.
+Current setting generates capitalized names for both of
+\verb|\Cref{}| and \verb|\cref{}|, but the former
+should be used at the beginning of a sentence.
+
+We are in the middle of conversion to
+\co{cleveref}-style cross\-/referencing.
+
+Cross-references to line numbers of code snippets
+can be done in a similar way by using \verb|\Clnref{}| and
+\verb|\clnref{}| macros, which mimic \co{cleveref}.
+The former puts ``Line'' as the name of the reference
+and the latter ``line''.
+
+Please refer to \co{cleveref}'s documentation for further
+info on its cleverness.
 
 \subsection{Non Breakable Spaces}
 \label{sec:app:styleguide:Non Breakable Spaces}
@@ -896,21 +955,16 @@ Example (quote from \cref{sec:app:whymb:Cache Structure}):
 \subsubsection{En Dash}
 \label{sec:app;styleguide:En Dash}
 
-In \LaTeX\ convention, en~dashes (\==) are used for a range of (mostly)
+In \LaTeX\ convention, en~dashes (\==) are used for ranges of (mostly)
 numbers.
-However, this is not followed in perfbook at all.
-Because of the heavy use of dashes (\=/) for such cases
-in plain-text communication, to make the \LaTeX\ sources compatible
-with them, plain dashes are kept unmodified in the sources.
-
-As a compromise, for those who are accustomed to en~dashes representing
-ranges, there is a script to substitute en~dashes for plain dashes.
-
-If you have the git repository of perfbook, by using a script
-\path{utilities/dohyphen2endash.sh}, you can do the substitutions.
-The script works only when you are in a clean git repository.
-Otherwise it will just abort to prevent you from losing local
-changes.
+Past revisions of perfbook didn't follow this rule and used
+plain dashes (\=/) for such cases.
+
+Now that \co{\\clnrefrange}, \co{\\crefrange},
+and their variants, which generate en~dashes, are used for ranges of
+cross\-/references, the remaining couple of tens of simple dashes
+of other types of ranges have been converted to en~dashes for
+consistency.
 
 Example with a simple dash:
 
-- 
2.17.1


